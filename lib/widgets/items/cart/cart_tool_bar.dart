import 'package:flutter/material.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/const/font_size.dart';
import 'package:mBet/utils/extensions/string_extension.dart';

class CartToolBar extends StatelessWidget {
  final int totalAmount;
  CartToolBar({
    this.totalAmount,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + NORMAL_DIM_2X,
        bottom: NORMAL_DIM_2X,
        left: NORMAL_DIM_2X,
        right: NORMAL_DIM_2X,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(NORMAL_DIM_2X),
          bottomRight: Radius.circular(NORMAL_DIM_2X),
        ),
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
          Text(
            "စုစုပေါင်း ${totalAmount.toString().toMMNumber()} ကျပ်",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          InkWell(
            child: Icon(
              Icons.shop_two,
              color: Color(PRIMARY_COLOR),
            ),
            onTap: null,
          )
        ],
      ),
    );
  }
}
