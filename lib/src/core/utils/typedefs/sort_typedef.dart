import 'package:frifri/src/feature/avia_tickets/domain/entities/destination_country_entity.dart';
import 'package:frifri/src/feature/avia_tickets/domain/entities/ticket_record_entity.dart';

import '../mappers/destination_mapper.dart';

/// FIXME: НАдо ли?

List<DestinationAirportEntity> sortDirectTicketList(
  final List<TicketRecordEntity> ticketRecordList,
  final List<DestinationAirportEntity> directOneWayTicketsList,
) {
  if (ticketRecordList.isEmpty) return directOneWayTicketsList;

  final sortList = directOneWayTicketsList;
  for (var element in ticketRecordList) {
    for (var i = 0; i < sortList.length; i++) {
      if (element.destination == sortList[i].destination) {
        sortList.removeAt(i);
        sortList.insert(element.index, DestinationMapper.of(element));
      }
    }
  }
  return directOneWayTicketsList;
}




///  Список полученный с supabase [TBS, BTM, ROM]
///
/// [TBS] это элемент [2] это индекс который указывает на расположение элемента
///  Список в локальном хранилище [DestinationCountry('TBS', 2)]
///
/// TBS  под вторым индексом
///Вывод: [BTM, ROM, TBS]