/// リポジトリ検索用ソート
enum SearchReposSort {
  bestMatch,
  stars,
  forks,
  helpWantedIssues,
  ;

  static SearchReposSort nameOf(String name) {
    return SearchReposSort.values.firstWhere((element) => element.name == name);
  }
}
