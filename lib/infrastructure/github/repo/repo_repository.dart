import '../../../domain/repositories/repo/entity/search_repos_sort.dart';
import '../../../domain/repositories/repo/entity/search_repos_result.dart';
import '../../../domain/repositories/repo/entity/search_repos_order.dart';
import '../../../domain/repositories/repo/entity/repo.dart';
import '../../../domain/repositories/repo/repo_repository.dart';
import '../api.dart';
import '../http_client.dart';

class GitHubRepoRepository implements RepoRepository {
  const GitHubRepoRepository({
    required this.api,
    required this.client,
  });

  final GitHubApi api;
  final GitHubHttpClient client;

  @override
  Future<String> getReadme({required Repo repo}) {
    // TODO: implement getReadme
    throw UnimplementedError();
  }

  @override
  Future<Repo> getRepo({required String ownerName, required String repoName}) {
    // TODO: implement getRepo
    throw UnimplementedError();
  }

  @override
  Future<SearchReposResult> searchRepos(
      {required String queryString,
      required SearchReposSort sort,
      required SearchReposOrder order,
      int? perPage,
      int? page}) {
    // TODO: implement searchRepos
    throw UnimplementedError();
  }
}
