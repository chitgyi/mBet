import 'dart:async';

import 'package:mBet/data/models/ticket_group_model.dart';
import 'package:mBet/network/response/api_response.dart';
import 'package:mBet/persistence/daos/ticket_dao.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
import 'package:mBet/utils/const/api_contants.dart';

class TicketGroupModelImpl extends TicketGroupModel {
  final TicketDao ticketDao;

  TicketGroupModelImpl(this.ticketDao);

  @override
  Future<List<TicketDataWrapper>> get ticketGroups async =>
      await ticketDao.tickets();

  @override
  Future<ResponseMetaData> fetchTicketGroups(
      {String path = TICKETS_ENTRY, bool isNextPage = false}) async {
    try {
      var res = await api.tickets(bearerToken, path);
      var data =
          (res.data as List).map((e) => Map<String, dynamic>.from(e)).toList();
      await ticketDao.insertAll(data, isAppend: isNextPage);
      return res.meta;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
