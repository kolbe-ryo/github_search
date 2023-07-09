import 'dart:convert';

import '../../../domain/repositories/repo/entity/search_repos_sort.dart';
import '../../../domain/repositories/repo/entity/search_repos_result.dart';
import '../../../domain/repositories/repo/entity/search_repos_order.dart';
import '../../../domain/repositories/repo/entity/repo.dart';
import '../../../domain/repositories/repo/entity/value_object/repo_count.dart';
import '../../../domain/repositories/repo/entity/value_object/repo_language.dart';
import '../../../domain/repositories/repo/repo_repository.dart';
import '../api.dart';
import '../http_client.dart';
import 'json_object/repo.dart';
import 'json_object/search_repos_result.dart';

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
  }) {
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
  }) {
    // TODO: implement getRepo
    throw UnimplementedError();
  }

  @override
  Future<String> getReadme({required Repo repo}) {
    // TODO: implement getReadme
    throw UnimplementedError();
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
