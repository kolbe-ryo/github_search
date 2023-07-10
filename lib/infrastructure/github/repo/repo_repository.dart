// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../../domain/exceptions.dart';
import '../../../domain/repositories/repo/entity/repo.dart';
import '../../../domain/repositories/repo/entity/search_repos_order.dart';
import '../../../domain/repositories/repo/entity/search_repos_result.dart';
import '../../../domain/repositories/repo/entity/search_repos_sort.dart';
import '../../../domain/repositories/repo/entity/value_object/repo_count.dart';
import '../../../domain/repositories/repo/entity/value_object/repo_language.dart';
import '../../../domain/repositories/repo/repo_repository.dart';
import '../api.dart';
import '../http_client.dart';
import 'json_object/repo.dart';
import 'json_object/search_repos_result.dart';

/// GitHubApiプロバイダー
final githubApiProvider = Provider<GitHubApi>(
  (ref) => const GitHubApi(),
);

/// GitHub版リポジトリRepositoryプロバイダー
final githubRepoRepositoryProvider = Provider<RepoRepository>(
  (ref) => GitHubRepoRepository(
    api: ref.watch(githubApiProvider),
    client: ref.watch(githubHttpClientProvider),
  ),
);

class GitHubRepoRepository implements RepoRepository {
  const GitHubRepoRepository({
    required this.api,
    required this.client,
  });

  final GitHubApi api;
  final GitHubHttpClient client;

  @override
  Future<SearchReposResult> searchRepos({
    required String queryString,
    required SearchReposSort sort,
    required SearchReposOrder order,
    int? perPage,
    int? page,
  }) async {
    return client.get(
      uri: api.searchRepos(
        queryString: queryString,
        sort: GitHubSearchReposSort.valueOf(sort),
        order: GitHubSearchReposOrder.valueOf(order),
        perPage: perPage,
        page: page,
      ),
      responseBuilder: (data) {
        final jsonObject = SearchReposResultJsonObject.fromJson(data);

        return SearchReposResult(
          totalCount: jsonObject.totalCount,
          queryString: queryString,
          items: jsonObject.items.map(repoBuilder).toList(),
        );
      },
    );
  }

  @override
  Future<Repo> getRepo({
    required String ownerName,
    required String repoName,
  }) async {
    return client.get(
      uri: api.getRepo(
        ownerName: ownerName,
        repoName: repoName,
      ),
      responseBuilder: (data) => repoBuilder(RepoJsonObject.fromJson(data)),
    );
  }

  @override
  Future<String> getReadme({required Repo repo}) async {
    // READMEファイル名のパターン（優先度順）
    const fileNames = <String>[
      'README.md',
      'ReadMe.md',
      'Readme.md',
      'readme.md',
    ];
    for (final fileName in fileNames) {
      final uri = Uri.parse(
        'https://raw.githubusercontent.com/${repo.ownerName}/${repo.repoName}/${repo.defaultBranch}/$fileName',
      );
      try {
        return await client.getRaw(uri: uri);
      } on NetworkException catch (error) {
        // 404 の場合はファイル名を変えてリトライする
        if (error.code == NetworkException.codeNotFound) {
          continue;
        }

        // 404 以外のエラーは即時 rethrow する
        rethrow;
      }
    }
    // 最終的に取得できなかったら 404 を返す
    throw NetworkException.notFound();
  }

  static Repo repoBuilder(RepoJsonObject jsonObject) {
    final ownerUrl = '$githubSiteUrl/${jsonObject.owner.login}';
    final repoUrl = '$ownerUrl/${jsonObject.name}';
    return Repo(
      ownerName: jsonObject.owner.login,
      avatarUrl: jsonObject.owner.avatarUrl,
      ownerUrl: ownerUrl,
      repoName: jsonObject.name,
      fullName: jsonObject.fullName,
      description: jsonObject.description,
      stargazersCount: RepoCount(jsonObject.stargazersCount),
      watchersCount: RepoCount(jsonObject.watchersCount),
      language: RepoLanguage(jsonObject.language),
      forksCount: RepoCount(jsonObject.forksCount),
      openIssuesCount: RepoCount(jsonObject.openIssuesCount),
      defaultBranch: jsonObject.defaultBranch,
      repoUrl: repoUrl,
      stargazersUrl: '$repoUrl/stargazers',
      watchersUrl: '$repoUrl/watchers',
      forksUrl: '$repoUrl/network/members',
      issuesUrl: '$repoUrl/issues',
    );
  }
}
