import 'package:flutter/material.dart';
import 'package:mBet/generated/locale_keys.g.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/widgets/navs/bottom_nav_bar_item.dart';

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
            .asMap()
            .entries
            .map((e) => InkWell(
                  onTap: () => onTap(e.key),
                  child: BottomNavBarItem(
                    selectedColor: selectedItemColor,
                    unselectedColor: unelecedItemColor,
                    title: e.value.title,
                    iconData: e.value.iconData,
                    activeColor: activeColor,
                    paddingOfActiveItem: paddingOfActiveItem,
                    isActived: currentIndex == e.key,
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
    title: LocaleKeys.home,
    iconData: Icons.home,
  ),
  BottomBarItemVO(
    title: LocaleKeys.profile,
    iconData: Icons.person,
  )
];
