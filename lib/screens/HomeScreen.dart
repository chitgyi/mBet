import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mBet/blocs/ticket_group_bloc.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/view_state.dart';
import 'package:mBet/widgets/items/home/ticket_list.dart';
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
                  return TicketList(bloc.tickets);
                  break;
                case ViewState.Error:
                default:
                  return Center(
                      child: Text('An error occurred \n ${bloc.errorMsg}'));
                  break;
              }
            },
          ),
        ),
      ],
    );
  }
}
