import 'package:drift/drift.dart';

class RecentSearch extends Table {
  TextColumn get countryName => text()();

  TextColumn get countryCode => text().unique()();

  TextColumn get airport => text()();
}
