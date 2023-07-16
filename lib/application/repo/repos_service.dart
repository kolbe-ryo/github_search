// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'state/repos_state.dart';

final reposServiceProvider = Provider((ref) => ReposService.new);

/// リポジトリ一覧サービス
class ReposService {
  const ReposService(this.ref);

  final Ref ref;

  /// 次のページを取得する
  Future<void> fetchNextPage() async {
    await ref.read(reposStateProvider.notifier).fetchNextPage();
  }
}
