import 'package:flutter/material.dart';
import 'package:mBet/blocs/cart_bloc.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/widgets/items/cart/cart_item.dart';
import 'package:mBet/widgets/items/cart/cart_tool_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartBloc>(
      builder: (context, bloc, child) => Column(
        children: [
          CartToolBar(
            totalAmount: bloc.totalMount,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bloc.cartList.length,
              padding: EdgeInsets.only(
                bottom: NORMAL_DIM_3X,
                top: NORMAL_DIM_2X,
              ),
              itemBuilder: (context, index) => CartItem(
                ticketDataWrapper: bloc.cartList[index],
                margin: EdgeInsets.symmetric(
                  horizontal: NORMAL_DIM_2X,
                  vertical: NORMAL_DIM,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
