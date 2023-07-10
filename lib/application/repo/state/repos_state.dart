// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../../domain/repositories/repo/entity/repo.dart';
import '../../../domain/repositories/repo/entity/search_repos_result.dart';

part 'repos_state.freezed.dart';

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
