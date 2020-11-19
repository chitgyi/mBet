import 'package:flutter/material.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/const/font_size.dart';
import 'package:mBet/widgets/items/home/search_bar.dart';

class ToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: NORMAL_DIM_2X),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                child: Icon(
                  Icons.menu,
                  size: 26,
                ),
                onTap: () {},
              ),
              SizedBox(
                width: NORMAL_DIM,
              ),
              Text(
                'mmLottery',
                style: TextStyle(
                    height: 1,
                    fontSize: TEXT_REGULAR_3X,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gabriela'),
              ),
              Spacer(),
              Text(
                '1000',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(PRIMARY_COLOR),
                ),
              ),
              Icon(
                Icons.monetization_on,
                color: Color(PRIMARY_COLOR),
              )
            ],
          ),
          SizedBox(
            height: NORMAL_DIM_2X,
          ),
          SearchBar(),
          SizedBox(
            height: NORMAL_DIM_2X,
          ),
        ],
      ),
    );
  }
}
