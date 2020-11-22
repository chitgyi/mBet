import 'package:mBet/data/models/base_model.dart';
import 'package:mBet/network/response/api_response.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
import 'package:mBet/utils/const/api_contants.dart';

abstract class TicketGroupModel extends BaseModel {
  Future<ResponseMetaData> fetchTicketGroups({String path = TICKETS_ENTRY});
  Future<List<TicketDataWrapper>> get ticketGroups;
}
