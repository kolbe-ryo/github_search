// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'entity/repo.dart';
import 'entity/repo_param.dart';
import 'entity/search_repos_order.dart';
import 'entity/search_repos_result.dart';
import 'entity/search_repos_sort.dart';

/// 取得したgitリポジトリを提供するプロバイダ
final repoProviderFamily = FutureProvider.family.autoDispose<Repo, RepoParam>(
  (ref, param) async {
    // キャッシュにあればそれを返却する
    final cache = param.cache;
    if (cache != null) {
      return cache;
    }
    return ref.watch(repoRepositoryProvider).getRepo(
          ownerName: param.ownerName,
          repoName: param.repoName,
        );
  },
  name: 'reppoProviderFamily',
);

/// Readmeプロバイダ
final readmeProviderFamily = FutureProvider.family.autoDispose<String, Repo>(
  (ref, repo) async {
    return ref.watch(repoRepositoryProvider).getReadme(repo: repo);
  },
  name: 'readmeProviderFamily',
);

final repoRepositoryProvider = Provider<RepoRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// gitリポジトリ用プロバイダ
abstract class RepoRepository {
  /// リポジトリを検索する
  Future<SearchReposResult> searchRepos({
    required String queryString,
    required SearchReposSort sort,
    required SearchReposOrder order,
    int? perPage,
    int? page,
  });

  /// リポジトリを取得する
  Future<Repo> getRepo({
    required String ownerName,
    required String repoName,
  });

  /// READMEを表示する
  Future<String> getReadme({
    required Repo repo,
  });
}
