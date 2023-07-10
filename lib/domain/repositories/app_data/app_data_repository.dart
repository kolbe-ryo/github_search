// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../repo/entity/search_repos_order.dart';
import '../repo/entity/search_repos_sort.dart';
import 'entity/app_data_key.dart';

/// リポジトリ検索用オーダー値プロバイダー
final searchReposOrderProvider = StateProvider<SearchReposOrder>((ref) {
  const key = AppDataKey.searchReposOrder;
  final repository = ref.watch(appDataRepositoryProvider);
  repository.change<SearchReposOrder>(key).listen((order) {
    ref.controller.state = order;
  });
  return repository.get(key);
});

/// リポジトリ検索用ソート値プロバイダー
/// TODO: Hiveに永続化されているか確認すること（ブレークポイントを打つ）
final searchReposSortProvider = StateProvider<SearchReposSort>((ref) {
  const key = AppDataKey.searchReposSort;
  final repository = ref.watch(appDataRepositoryProvider);
  repository.change<SearchReposSort>(key).listen((order) {
    ref.controller.state = order;
  });
  return repository.get(key);
});

/// アプリデータRepositoryプロバイダー
final appDataRepositoryProvider = Provider<AppDataRepository>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// アプリデータRepository
abstract class AppDataRepository {
  void set<T extends Object?>(AppDataKey key, T value);

  T get<T extends Object?>(AppDataKey key);

  Stream<T> change<T extends Object?>(AppDataKey key);
}
