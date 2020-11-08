import 'package:flutter/material.dart';
import 'package:mBet/generated/locale_keys.g.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/widgets/navs/bottom_nav_bar_item.dart';
import 'package:easy_localization/easy_localization.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomBarItemVO> items;
  final double elevation;
  final BorderRadius borderRadius;
  final EdgeInsets paddingOfActiveItem;
  final Color backgroundColor,
      activeColor,
      selectedItemColor,
      unelecedItemColor;
  final bool isLoggedIn;
  final void Function(int) onTap;
  final Curve animnaiton;
  final int currentIndex;
  final double height;

  BottomNavBar(
      {@required this.items,
      @required this.height,
      this.isLoggedIn = false,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.blue,
      this.onTap,
      this.paddingOfActiveItem = const EdgeInsets.all(8.0),
      this.borderRadius = BorderRadius.zero,
      this.elevation = 0,
      this.currentIndex = 0,
      this.animnaiton = Curves.decelerate,
      this.selectedItemColor = Colors.white,
      this.unelecedItemColor = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: NORMAL_DIM,
        right: NORMAL_DIM,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(elevation, -elevation),
              blurRadius: 5,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items
            .map((e) => InkWell(
                  onTap: () {},
                  child: BottomNavBarItem(
                    selectedColor: selectedItemColor,
                    unselectedColor: unelecedItemColor,
                    title: e.title,
                    iconData: e.iconData,
                    activeColor: activeColor,
                    paddingOfActiveItem: paddingOfActiveItem,
                    isActived: currentIndex == items.indexOf(e),
                    animnaiton: animnaiton,
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class BottomBarItemVO {
  final String title;
  final IconData iconData;
  BottomBarItemVO({this.title, this.iconData});
}

final bottomNavItems = [
  BottomBarItemVO(
    title: LocaleKeys.home.tr(),
    iconData: Icons.home,
  ),
  BottomBarItemVO(
    title: LocaleKeys.two_d.tr(),
    iconData: Icons.library_books,
  ),
  BottomBarItemVO(
    title: LocaleKeys.three_d.tr(),
    iconData: Icons.shopping_cart,
  ),
  BottomBarItemVO(
    title: LocaleKeys.football.tr(),
    iconData: Icons.ballot,
  ),
  BottomBarItemVO(
    title: LocaleKeys.profile.tr(),
    iconData: Icons.person,
  )
];
