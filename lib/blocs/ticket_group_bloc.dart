import 'package:mBet/data/models/impl/ticket_group_model_impl.dart';
import 'package:mBet/persistence/database.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
import 'package:mBet/utils/state_controller.dart';
import 'package:mBet/utils/view_state.dart';

class TicketGroupBloc extends StateController {
  TicketGroupModelImpl _groupModelImpl;

  List<TicketDataWrapper> tickets;

  TicketGroupBloc() {
    _groupModelImpl = TicketGroupModelImpl(MyDatabase().ticketDao);
    _retrieveTickets();
  }

  _retrieveTickets() {
    _groupModelImpl.ticketGroups.then((data) {
      tickets = data;
      print(tickets);
      setState(ViewState.Completed);
    });
  }

  Future<void> loadTicketGroups({int times}) async {
    try {
      await _groupModelImpl.fetchTicketGroups(times);
      _retrieveTickets();
    } catch (e) {
      setError(e.toString());
    }
  }
}
