import 'package:drift/drift.dart';

import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

part 'search_database.g.dart';

@DriftDatabase(tables: [RecentSearch])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> addRecentSearch(RecentSearchData data) async {
    return await into(recentSearch).insert(data);
  }

  Future<List<RecentSearchData>> getRecentSearches() async {
    return await select(recentSearch).get();
  }

  Future<bool> hasRecentSearches(String countryCode) async {
    return await (select(recentSearch)
              ..where((tbl) => tbl.countryCode.equals(countryCode)))
            .getSingleOrNull() !=
        null;
  }
}

class RecentSearch extends Table {
  TextColumn get countryName => text()();

  TextColumn get countryCode => text()();

  TextColumn get airport => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;

    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
