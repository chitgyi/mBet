import 'dart:async';

import 'package:mBet/persistence/database.dart';
import 'package:mBet/persistence/entities/tickets/ticket.dart';
import 'package:mBet/persistence/entities/tickets/ticket_group.dart';
import 'package:mBet/persistence/entities/tickets/ticket_type.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'ticket_dao.g.dart';

@UseDao(tables: [TicketGroupTable, TicketTable, TicketTypeTable])
class TicketDao extends DatabaseAccessor<MyDatabase> with _$TicketDaoMixin {
  TicketDao(MyDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<TicketDataWrapper>> tickets() async {
    var groupQuery = select(ticketGroupTable)
      ..orderBy([(u) => OrderingTerm.desc(u.id)]);
    var groups = await groupQuery.get();
    var data = groups.map((group) async {
      var query = select(ticketTable);
      query.where((tbl) => tbl.ticket_group_id.equals(group.id));
      var query2 = select(ticketTypeTable);
      query2.where((tbl) => tbl.id.equals(group.type_id));
      return TicketDataWrapper(
        tickets: await query.get(),
        ticketGroup: group,
        type: await query2.getSingle(),
      );
    }).toList();
    return await Future.wait(data);
  }

  Future<List<TicketGroup>> get ticketGroups async =>
      await select(ticketGroupTable).get();

  Future<void> insertAll(List<Map<String, dynamic>> dataList,
      {bool isAppend = false}) async {
    if (!isAppend) {
      await deleteAll();
    }
    var futures = dataList.map((data) async {
      await insertType(TicketType.fromJson(data['type']));
      await insertGroup(TicketGroup.fromJson(data));
      await Future.wait((data['tickets'] as List)
          .map((ticket) => insertTicket(Ticket.fromJson(ticket)))
          .toList());
    }).toList();
    await Future.wait(futures);
  }

  Future<void> deleteAll() async {
    await delete(ticketGroupTable).go();
    await delete(ticketTypeTable).go();
    await delete(ticketTable).go();
  }

  Future<void> insertGroup(TicketGroup data) async {
    await into(ticketGroupTable).insertOnConflictUpdate(data);
  }

  Future<void> insertType(TicketType data) async {
    await into(ticketTypeTable).insertOnConflictUpdate(data);
  }

  Future<void> insertTicket(Ticket data) async {
    await into(ticketTable).insertOnConflictUpdate(data);
  }
}
