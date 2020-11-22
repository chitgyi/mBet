import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mBet/blocs/ticket_group_bloc.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/view_state.dart';
import 'package:mBet/widgets/items/home/lottery_ticket_item.dart';
import 'package:mBet/widgets/items/home/tool_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController =
      ScrollController(keepScrollOffset: true);
  bool showLoadMoreIndicator = false;
  TicketGroupBloc _bloc;

  @override
  void initState() {
    _bloc = Provider.of<TicketGroupBloc>(context, listen: false)
      ..loadTicketGroups();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!showLoadMoreIndicator) {
          setState(() {
            showLoadMoreIndicator = true;
          });
          _fetchNextData();
        }
      }
    });
    super.initState();
  }

  _fetchNextData() async {
    _bloc.loadTicketNextGroups().then((value) {
      setState(() {
        showLoadMoreIndicator = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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

  Widget _buidUI(BuildContext context, List<TicketDataWrapper> data) {
    return RefreshIndicator(
      displacement: 0,
      onRefresh: () async =>
          await Provider.of<TicketGroupBloc>(context, listen: false)
              .loadTicketGroups(),
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount: data.length + 1,
        padding: EdgeInsets.only(
          bottom: NORMAL_DIM_3X,
        ),
        itemBuilder: (context, index) => index == data.length
            ? showLoadMoreIndicator
                ? CupertinoActivityIndicator()
                : SizedBox.shrink()
            : LotteryTicketItem(
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
