// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../../domain/repositories/app_data/app_data_repository.dart';
import '../../../domain/repositories/repo/entity/repo.dart';
import '../../../domain/repositories/repo/entity/search_repos_order.dart';
import '../../../domain/repositories/repo/entity/search_repos_result.dart';
import '../../../domain/repositories/repo/entity/search_repos_sort.dart';
import '../../../domain/repositories/repo/repo_repository.dart';
import '../../../util/logger.dart';
import 'search_repos_query.dart';

part 'repos_state.freezed.dart';

final reposStateProvider = StateNotifierProvider.autoDispose<ReposStateNotifier, AsyncValue<ReposState>>(
  (ref) => ReposStateNotifier(
    repoRepository: ref.watch(repoRepositoryProvider),
    queryString: ref.watch(searchReposQueryProvider),
    sort: ref.watch(searchReposSortProvider),
    order: ref.watch(searchReposOrderProvider),
  ),
);

/// リポジトリ一覧状態
@freezed
class ReposState with _$ReposState {
  const factory ReposState({
    @Default(0) int totalCount,
    @Default(<Repo>[]) List<Repo> items,
    @Default(false) bool hasNext,
    @Default(1) int page,
    @Default('') String queryString,
  }) = _ReposState;

  factory ReposState.from(SearchReposResult result) {
    return ReposState(
      totalCount: result.totalCount,
      items: result.items,
      hasNext: result.items.length < result.totalCount,
      queryString: result.queryString,
    );
  }
}

class ReposStateNotifier extends StateNotifier<AsyncValue<ReposState>> {
  ReposStateNotifier({
    required this.repoRepository,
    required this.queryString,
    required this.sort,
    required this.order,
  }) : super(const AsyncValue.loading()) {
    () async {
      state = await AsyncValue.guard(() async {
        final trimQueryString = queryString.trim();
        if (trimQueryString.isEmpty) {
          return const ReposState();
        }

        final result = await repoRepository.searchRepos(
          queryString: trimQueryString,
          sort: sort,
          order: order,
          perPage: perPage,
        );
        logger.i(
          'Search repos result: totalCount = ${result.totalCount}, '
          'fetchItems = ${result.items.length}',
        );
        return ReposState.from(result);
      });
    };
  }

  final RepoRepository repoRepository;

  /// 検索文字列
  final String queryString;

  /// 検索ソート
  final SearchReposSort sort;

  /// 検索オーダー
  final SearchReposOrder order;

  /// 1ページに取得するレポジトリの数
  static const perPage = 30;

  /// 次のページを取得する
  Future<void> fetchNextPage() async {
    final value = state.value;
    if (value == null) {
      return;
    }

    // 次のページが無ければ何もしない
    if (!value.hasNext) {
      return;
    }

    // 次のページを取得する
    state = await AsyncValue.guard(() async {
      final result = await repoRepository.searchRepos(
        queryString: queryString,
        sort: sort,
        order: order,
        perPage: perPage,
        page: value.page + 1,
      );

      final appendedItems = result.items;
      logger.i(
        'Search repos result: totalCount = ${result.totalCount}, '
        'fetchItems = ${result.items.length}, '
        'totalItems = ${value.items.length + appendedItems.length}',
      );
      return value.copyWith(
        items: value.items + appendedItems,
        hasNext: result.items.length == perPage,
        page: value.page + 1,
      );
    });
  }
}
