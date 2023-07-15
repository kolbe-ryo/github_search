import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repositories/query_history/entity/query_history.dart';
import '../../../infrastructure/isar/query_history/query_history_repository.dart';
import 'search_repos_query.dart';

/// リポジトリ検索履歴一覧プロバイダー
final queryHistoriesProvider = FutureProvider.autoDispose<List<QueryHistory>>((ref) async {
  final enteringQueryString = ref.watch(searchReposEnteringQueryProvider);
  return ref.watch(queryHistoriesProviderFamily(enteringQueryString).future);
});
