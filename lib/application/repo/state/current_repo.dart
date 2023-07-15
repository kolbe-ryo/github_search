import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repositories/repo/entity/repo.dart';
import '../../../domain/repositories/repo/entity/repo_param.dart';
import '../../../domain/repositories/repo/repo_repository.dart';

/// 現在のリポジトリプロバイダー
final currentRepoParamProvider = Provider<RepoParam>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

final currentRepoProvider = FutureProvider.autoDispose<Repo>(
  (ref) async {
    final param = ref.watch(currentRepoParamProvider);
    return ref.watch(repoProviderFamily(param).future);
  },
  dependencies: [
    currentRepoParamProvider,
    repoProviderFamily,
  ],
  name: 'currentRepoProvider',
);
