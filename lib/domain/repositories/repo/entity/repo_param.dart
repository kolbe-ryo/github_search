// Copyright 2022 susatthi All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'repo.dart';

part 'repo_param.freezed.dart';

/// リポジトリパラメーター
/// Get a repository [https://docs.github.com/ja/rest/repos/repos?apiVersion=2022-11-28#get-a-repository]
@freezed
class RepoParam with _$RepoParam {
  const factory RepoParam({
    /// オーナー名
    required String ownerName,

    /// リポジトリ名
    required String repoName,

    /// 一覧画面から渡されるリポジトリデータ
    /// 詳細画面で再読込した場合などは null になる場合がある
    Repo? cache,
  }) = _RepoParam;
}
