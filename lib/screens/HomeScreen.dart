import 'package:flutter/material.dart';
import 'package:mBet/blocs/ticket_group_bloc.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/view_state.dart';
import 'package:mBet/widgets/items/home/lottery_ticket_item.dart';
import 'package:mBet/widgets/items/home/tool_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<TicketGroupBloc>(context, listen: false).loadTicketGroups();
    return Column(
      children: [
        SizedBox(
          height: NORMAL_DIM_2X + MediaQuery.of(context).padding.top,
        ),
        ToolBar(),
        Expanded(
          child: Consumer<TicketGroupBloc>(
            builder: (context, bloc, child) {
              switch (bloc.viewState) {
                case ViewState.Loading:
                  return Center(child: CircularProgressIndicator());
                  break;
                case ViewState.Completed:
                  return _buidUI(context, bloc.tickets);
                  break;
                case ViewState.Error:
                default:
                  return Center(child: Text('An error occurred'));
                  break;
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buidUI(BuildContext context, List<TicketDataWrapper> data) {
    return RefreshIndicator(
      displacement: 0,
      onRefresh: () async =>
          await Provider.of<TicketGroupBloc>(context, listen: false)
              .loadTicketGroups(),
      child: ListView.builder(
        itemCount: data.length,
        padding: EdgeInsets.only(
          bottom: NORMAL_DIM_3X,
        ),
        itemBuilder: (context, index) => LotteryTicketItem(
          ticketDataWrapper: data[index],
          margin: EdgeInsets.symmetric(
            horizontal: NORMAL_DIM_2X,
            vertical: NORMAL_DIM,
          ),
        ),
      ),
    );
  }
}
