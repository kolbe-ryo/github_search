// Package imports:
import 'package:isar/isar.dart';

part 'query_history.g.dart';

/// SQLで言うテーブルのこと
@Collection()
class QueryHistoryCollection {
  Id id = Isar.autoIncrement;

  /// 検索文字列
  late String queryString;

  /// 検索日時
  @Index()
  late DateTime searchedAt;

  @override
  String toString() => '{id: $id, queryString: $queryString, searchedAt: $searchedAt}';
}
