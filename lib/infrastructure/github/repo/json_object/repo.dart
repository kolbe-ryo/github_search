// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'owner.dart';

part 'repo.freezed.dart';
part 'repo.g.dart';

/// リポジトリJsonObject（必要なjsonObjectのみを取得する）
@freezed
class RepoJsonObject with _$RepoJsonObject {
  const factory RepoJsonObject({
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required OwnerJsonObject owner,
    required String? description,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(name: 'watchers_count') required int watchersCount,
    String? language,
    @JsonKey(name: 'forks_count') required int forksCount,
    @JsonKey(name: 'open_issues_count') required int openIssuesCount,
    @JsonKey(name: 'default_branch') required String defaultBranch,
  }) = _RepoJsonObject;

  factory RepoJsonObject.fromJson(Map<String, dynamic> json) => _$RepoJsonObjectFromJson(json);
}
