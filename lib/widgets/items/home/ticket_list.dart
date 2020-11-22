import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mBet/blocs/ticket_group_bloc.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/widgets/items/home/lottery_ticket_item.dart';
import 'package:provider/provider.dart';

class TicketList extends StatefulWidget {
  final List<TicketDataWrapper> tickets;
  TicketList(
    this.tickets,
  );
  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  final ScrollController _scrollController =
      ScrollController(keepScrollOffset: true);
  bool showLoadMoreIndicator = false;

  @override
  void initState() {
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
    Provider.of<TicketGroupBloc>(context, listen: false)
        .loadTicketNextGroups()
        .then((value) {
      setState(() {
        showLoadMoreIndicator = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 0,
      onRefresh: () async =>
          await Provider.of<TicketGroupBloc>(context, listen: false)
              .loadTicketGroups(),
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount: widget.tickets.length + 1,
        padding: EdgeInsets.only(
          bottom: NORMAL_DIM_3X,
        ),
        itemBuilder: (context, index) => index == widget.tickets.length
            ? showLoadMoreIndicator
                ? CupertinoActivityIndicator()
                : SizedBox.shrink()
            : LotteryTicketItem(
                ticketDataWrapper: widget.tickets[index],
                margin: EdgeInsets.symmetric(
                  horizontal: NORMAL_DIM_2X,
                  vertical: NORMAL_DIM,
                ),
              ),
      ),
    );
  }
}
