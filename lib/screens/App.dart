import 'package:flutter/material.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/widgets/navs/bottom_nav_bar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text('Home Page'),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: BottomNavBar(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(NORMAL_DIM_2X),
                topRight: Radius.circular(NORMAL_DIM_2X),
              ),
              activeColor: Color(PRIMARY_COLOR),
              items: bottomNavItems,
              height: kBottomNavigationBarHeight,
            ),
            bottom: 0,
          )
        ],
      ),
    );
  }
}
