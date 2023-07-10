// Package imports:
import 'package:isar/isar.dart';

// Project imports:
import 'query_history/collection/query_history.dart';

/// Isar を初期化する
Future<Isar> initIsar({required String directory}) async {
  return Isar.open(
    [
      QueryHistoryCollectionSchema,
    ],
    directory: directory,
  );
}
