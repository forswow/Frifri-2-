import 'package:drift/drift.dart';

class TicketDatabase extends Table {
  TextColumn get origin => text()();

  TextColumn get destination => text()();

  IntColumn get index => integer()();
}
