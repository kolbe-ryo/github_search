import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/exceptions.dart';
import '../../domain/repositories/app_data/app_data_repository.dart';
import '../../domain/repositories/query_history/entity/query_history.dart';
import '../../domain/repositories/query_history/query_history_repository.dart';
import '../../domain/repositories/repo/entity/search_repos_order.dart';
import '../../domain/repositories/repo/entity/search_repos_sort.dart';
import '../../infrastructure/isar/query_history/query_history_repository.dart';
import '../../util/logger.dart';
import 'state/search_repos_query.dart';

class SearchReposService {
  SearchReposService(this.ref);

  final Ref ref;

  /// 保留中の検索文字列
  String? holdQueryString;

  /// リポジトリ検索文字列を入力する
  Future<void> enter(String queryString) async {
    // もし現在入力中の文字列と同じ場合は更新しない
    if (ref.read(searchReposEnteringQueryProvider) == queryString) {
      return;
    }

    holdQueryString = queryString;

    // 連続で入力されると負荷があがるので一定時間待つ
    await Future<void>.delayed(const Duration(milliseconds: 300));

    // 保留中に次の検索文字列で上書きされたら更新しない
    if (holdQueryString != queryString) {
      return;
    }

    ref.read(searchReposEnteringQueryProvider.notifier).state = queryString;

    // 初期化
    holdQueryString = null;
  }

  /// リポジトリ検索文字列をクリアする
  Future<void> clear() async {
    ref.read(searchReposEnteringQueryProvider.notifier).state = '';
  }

  /// リポジトリ検索文字列を確定する
  Future<void> done(String queryString) async {
    ref.read(searchReposQueryProvider.notifier).state = queryString;

    try {
      await ref.read(queryHistoryRepositoryProvider).add(
            QueryHistory.create(queryString.trim()),
          );
    } on ValidatorException catch (e) {
      // エラーが起こっても何もしない
      logger.i(e);
    }
  }

  /// リポジトリ検索履歴を選択する
  Future<void> select(QueryHistory queryHistory) async {
    ref.read(searchReposQueryProvider.notifier).state = queryHistory.queryString.value;
    await ref.read(queryHistoryRepositoryProvider).add(queryHistory);
  }

  /// リポジトリ検索履歴を削除する
  Future<void> delete(QueryHistory queryHistory) async {
    await ref.read(queryHistoryRepositoryProvider).delete(queryHistory);
  }

  // リポジトリ検索用オーダー値を更新する
  void updateSearchReposOrder(SearchReposOrder order) {
    ref.read(searchReposOrderProvider.notifier).update((_) => order);
  }

  // リポジトリ検索用ソート値を更新する
  void updateSearchReposSort(SearchReposSort sort) {
    ref.read(searchReposSortProvider.notifier).update((_) => sort);
  }
}
