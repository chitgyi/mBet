import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mBet/blocs/cart_bloc.dart';
import 'package:mBet/persistence/entities/tickets/ticket_wrapper.dart';
import 'package:mBet/screens/App.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/const/font_size.dart';
import 'package:mBet/widgets/utils/rectangle_shape.dart';
import 'package:mBet/utils/extensions/string_extension.dart';
import 'package:provider/provider.dart';

class LotteryTicketItem extends StatelessWidget {
  final EdgeInsets margin;
  final TicketDataWrapper ticketDataWrapper;
  LotteryTicketItem({
    this.margin = EdgeInsets.zero,
    this.ticketDataWrapper,
  });
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              color: Colors.black12,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${ticketDataWrapper.ticketGroup.times.toString().toMMNumber()} ကြိမ်မြောက်',
                      style: TextStyle(
                        fontSize: TEXT_REGULAR,
                        fontFamily: 'Pyidaungsu',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: NORMAL_DIM),
                      child: Text(
                        ticketDataWrapper.ticketGroup.merchant ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.0,
                        ),
                      ),
                    ),
                    Text(
                      ticketDataWrapper.ticketNumbers,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Pyidaungsu',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                var isAdded = Provider.of<CartBloc>(context, listen: false)
                    .addItem(ticketDataWrapper);
                if (isAdded) {
                  _showSnackBar(context);
                } else {
                  _showDialog(context);
                }
              },
              child: Stack(
                children: [
                  SizedBox(
                    width: 110,
                    child: ClipPath(
                      clipper: RectangleShape(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: this.color,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: Text(
                      '${ticketDataWrapper.type.price.toString().toMMNumber()} ကျပ်',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 120 * 0.3,
                    right: 30,
                    child: Icon(Icons.add_shopping_cart, color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color get color {
    switch (ticketDataWrapper.type.name) {
      case "Type One":
        return Color(PRIMARY_COLOR);
        break;
      case "Type Two":
        return Color(GREEN);
        break;
      case "Type Three":
        return Color(RED);
        break;
      default:
        return Colors.accents[Random().nextInt(3)];
        break;
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Icon(
          Icons.info_outline,
          size: 50,
          color: Colors.redAccent,
        ),
        content: Text(
          'စျေးခြင်းထဲတွင် ရှိနေပြီးသားဖြစ်ပါတယ်။',
          style: TextStyle(
            fontFamily: 'Pyidaungsu',
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    App.scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('စျေးခြင်းထဲသို့ ထည့်ပြီးပါပြီ။'),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }
}
