// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _Repo;

  const Repo._();

  @override
  String toString() => 'Repo($fullName)';
}
