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

class CartItem extends StatelessWidget {
  final EdgeInsets margin;
  final TicketDataWrapper ticketDataWrapper;
  CartItem({
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
                Provider.of<CartBloc>(context, listen: false)
                    .remove(ticketDataWrapper);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                padding: EdgeInsets.symmetric(horizontal: NORMAL_DIM),
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_circle_outline_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      '${ticketDataWrapper.type.price.toString().toMMNumber()} ကျပ်',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
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
}
