// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'value_object/repo_count.dart';
import 'value_object/repo_language.dart';

part 'repo.freezed.dart';

@freezed
class Repo with _$Repo {
  const factory Repo({
    /// オーナー名
    required String ownerName,

    /// アバターURL
    required String avatarUrl,

    /// オーナーURL
    required String? ownerUrl,

    /// リポジトリ名
    required String repoName,

    /// リポジトリ名（フル）
    required String fullName,

    /// 説明
    String? description,

    /// スター数
    required RepoCount stargazersCount,

    /// ウォッチャー数
    required RepoCount watchersCount,

    /// プロジェクト言語
    required RepoLanguage language,

    /// フォーク数
    required RepoCount forksCount,

    /// Issue数
    required RepoCount openIssuesCount,

    /// デフォルトブランチ
    required String defaultBranch,

    /// リポジトリURL
    String? repoUrl,

    /// スター数URL
    String? stargazersUrl,

    /// ウォッチャー数URL
    String? watchersUrl,

    /// フォーク数URL
    String? forksUrl,

    /// Issue数URL
    String? issuesUrl,
  }) = _Repo;

  const Repo._();

  @override
  String toString() => 'Repo($fullName)';
}
