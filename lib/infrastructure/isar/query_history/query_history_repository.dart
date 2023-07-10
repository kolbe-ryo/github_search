import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repositories/query_history/entity/query_history.dart';

/// 検索履歴一覧プロバイダー
final queryHistoriesProviderFamily =
    FutureProvider.family.autoDispose<List<QueryHistory>, String>((ref, queryString) async {
  final repository = ref.watch(queryHistoryRepositoryProvider);

  // このStreamは使用しない？
  // repository.changes(queryString: queryString).listen((queryHistories) {
  //   ref.state = AsyncValue.data(queryHistories);
  // });
  return repository.finds(queryString: queryString);
});

/// 検索履歴Repositoryプロバイダー
final queryHistoryRepositoryProvider = Provider<QueryHistoryRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// 検索履歴Repository
abstract class QueryHistoryRepository {
  /// 検索履歴を登録する
  Future<void> add(QueryHistory queryHistory);

  /// 検索履歴を削除する
  Future<void> delete(QueryHistory queryHistory);

  /// 検索履歴一覧を検索する
  ///
  /// - 検索条件
  ///   - 大文字小文字を区別しない [queryString] から始まる
  /// - ソート
  ///   - 検索日時の降順
  /// - 検索件数
  ///   - 20件
  Future<List<QueryHistory>> finds({required String queryString});

  /// 検索履歴一覧のStreamを返す
  ///
  /// - 検索条件
  ///   - 大文字小文字を区別しない [queryString] から始まる
  /// - ソート
  ///   - 検索日時の降順
  /// - 検索件数
  ///   - 20件
  Stream<List<QueryHistory>> changes({required String queryString});
}
