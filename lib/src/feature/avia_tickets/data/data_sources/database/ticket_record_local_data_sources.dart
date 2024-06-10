import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:frifri/src/core/data_base/search_database.dart';
import 'package:frifri/src/feature/avia_tickets/data/mappers/direct_one_way_mapper.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/direct_oneway_tickets_entity.dart';

import '../../../domain/entities/ticket_record_entity.dart';

abstract interface class ITicketRecordLocalDataSources {
  Future<List<TicketRecordEntity>> fetchTickets(String originCountry);

  Future<void> insertTickets(List<DirectOnewayTicketsEntity> ticketIndexEntity);

  Future<void> deleteTickets(String origin);
}

class TicketRecordLocalDataSources implements ITicketRecordLocalDataSources {
  TicketRecordLocalDataSources({required this.database});

  final AppDatabase database;

  @override
  Future<List<TicketRecordEntity>> fetchTickets(
    String originCountry,
  ) async {
    try {
      final result = await (database.select(database.ticketDatabase)
            ..where((tbl) => tbl.origin.like(originCountry)))
          .get();

      return result.map((e) => TicketRecordEntity.fromMap(e.toJson())).toList();
    } on SqliteException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> insertTickets(List<DirectOnewayTicketsEntity> ticketList) async {
    try {
      for (var element in ticketList) {
        await database.into(database.ticketDatabase).insert(
              TicketDatabaseData.fromJson(
                DirectOneWayMapper.of(element).toMap(),
              ),
            );
      }
    } on SqliteException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> deleteTickets(String origin) async {
    try {
      database.delete(database.ticketDatabase)
        ..where((tbl) => tbl.origin.equals(origin))
        ..go();
    } on SqliteException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
