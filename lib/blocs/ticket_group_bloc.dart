import 'package:mBet/data/models/impl/ticket_group_model_impl.dart';
import 'package:mBet/network/response/api_response.dart';
import 'package:mBet/persistence/database.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
import 'package:mBet/utils/pure_function.dart';
import 'package:mBet/utils/state_controller.dart';
import 'package:mBet/utils/view_state.dart';

class TicketGroupBloc extends StateController {
  TicketGroupModelImpl _groupModelImpl;

  List<TicketDataWrapper> tickets;
  ResponseMetaData _metaData;

  TicketGroupBloc() {
    _groupModelImpl = TicketGroupModelImpl(MyDatabase().ticketDao);
    _retrieveTickets();
  }

  _retrieveTickets() {
    _groupModelImpl.ticketGroups.then((data) {
      tickets = data;
      setState(ViewState.Completed);
    });
  }

  Future<void> loadTicketGroups() async {
    try {
      if (isNullOrEmpty(tickets)) {
        viewState = ViewState.Loading;
      }
      _metaData = await _groupModelImpl.fetchTicketGroups();
      _retrieveTickets();
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> loadTicketNextGroups() async {
    try {
      if (_metaData?.nextPageUrl != null) {
        await _groupModelImpl.fetchTicketGroups(
            path: _metaData.nextPageUrl, isNextPage: true);
        _retrieveTickets();
      } else {
        print("No More Data");
      }
    } catch (e) {
      setError(e.toString());
    }
  }
}
