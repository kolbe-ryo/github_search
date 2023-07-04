import '../repo/entity/search_repos_order.dart';
import '../repo/entity/search_repos_sort.dart';
import 'entity/app_data_key.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
final searchReposSortProvider = StateProvider<SearchReposSort>((ref) {
  const key = AppDataKey.searchReposSort;
  final repository = ref.watch(appDataRepositoryProvider);
  // SearchReposSortの変更を監視し、変更されたらSearchReposSortの値を変更値に変える。
  // アプリ内のstateを直接変更するのではなく、Hiveを変更し、Hiveの変更をstateに反映する。
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
