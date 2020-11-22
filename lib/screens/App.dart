import 'package:flutter/material.dart';
import 'package:mBet/blocs/app_bloc.dart';
import 'package:mBet/screens/CartScreen.dart';
import 'package:mBet/screens/HomeScreen.dart';
import 'package:mBet/screens/ProfileScreen.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/widgets/navs/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Selector<AppBloc, int>(
        selector: (context, bloc) => bloc.currentPageIndex,
        builder: (context, index, child) => Stack(
          children: [
            Positioned.fill(
              bottom: kBottomNavigationBarHeight - NORMAL_DIM_2X,
              child: IndexedStack(
                index: index,
                children: [
                  HomeScreen(),
                  CartScreen(),
                  Profile(),
                ],
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: kBottomNavigationBarHeight +
                  MediaQuery.of(context).padding.bottom,
              child: BottomNavBar(
                onTap: (index) {
                  Provider.of<AppBloc>(context, listen: false)
                      .setCurrentPageIndex(index);
                },
                currentIndex: index,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(NORMAL_DIM_2X),
                  topRight: Radius.circular(NORMAL_DIM_2X),
                ),
                activeColor: Color(PRIMARY_COLOR),
                items: bottomNavItems,
                height: double.infinity,
              ),
              bottom: 0,
            )
          ],
        ),
      ),
    );
  }
}
