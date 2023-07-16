// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../../../../util/env/env_define.dart';
import '../../../util/env/env.default.dart';

/// リポジトリ検索文字列初期値プロバイダー
final searchReposInitQueryProvider = Provider<String>(
  (ref) => const String.fromEnvironment(
    dartDefineKeyDefaultSearchValue,
    //ignore: avoid_redundant_argument_values
    defaultValue: Env.defaultSearchValue,
  ),
);

/// リポジトリ検索文字列プロバイダー
final searchReposQueryProvider = StateProvider<String>(
  (ref) => ref.watch(searchReposInitQueryProvider),
  name: 'searchReposQueryProvider',
);

/// 入力中のリポジトリ検索文字列プロバイダー
final searchReposEnteringQueryProvider = StateProvider<String>(
  (ref) => ref.watch(searchReposQueryProvider),
);
