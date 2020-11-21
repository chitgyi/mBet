import 'dart:async';

import 'package:mBet/data/models/ticket_group_model.dart';
import 'package:mBet/persistence/daos/ticket_dao.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';

class TicketGroupModelImpl extends TicketGroupModel {
  final TicketDao ticketDao;

  TicketGroupModelImpl(this.ticketDao);

  @override
  Future<void> fetchTicketGroups(int times) async {
    try {
      var res = await api.tickets(bearerToken, times: times);
      var data =
          (res.data as List).map((e) => Map<String, dynamic>.from(e)).toList();
      await ticketDao.insertAll(data);
      print('Inserted........');
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<TicketDataWrapper>> get ticketGroups async =>
      await ticketDao.tickets();
}
