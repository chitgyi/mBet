import 'package:flutter/material.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/widgets/items/home/lottery_ticket_item.dart';
import 'package:mBet/widgets/utils/ticket_type.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.only(bottom: NORMAL_DIM_3X, top: NORMAL_DIM_2X),
      itemBuilder: (context, index) => LotteryTicketItem(
        ticketType:
            index % 2 == 0 ? TicketType.TwoTicket : TicketType.FiveTicket,
        margin: EdgeInsets.symmetric(
          horizontal: NORMAL_DIM_2X,
          vertical: NORMAL_DIM,
        ),
      ),
    );
  }
}
