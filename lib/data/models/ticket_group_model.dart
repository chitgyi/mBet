import 'package:mBet/data/models/base_model.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';

abstract class TicketGroupModel extends BaseModel {
  Future<void> fetchTicketGroups(int times);
  Future<List<TicketDataWrapper>> get ticketGroups;
}
