import 'package:flutter/material.dart';
import 'package:mBet/generated/locale_keys.g.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:easy_localization/easy_localization.dart';

class BottomNavBarItem extends StatefulWidget {
  final bool isActived;
  final IconData iconData;
  final String title;
  final Color activeColor, selectedColor, unselectedColor;
  final EdgeInsets paddingOfActiveItem;
  final Curve animnaiton;
  BottomNavBarItem(
      {@required this.isActived,
      @required this.iconData,
      @required this.title,
      this.animnaiton = Curves.decelerate,
      this.paddingOfActiveItem = const EdgeInsets.all(NORMAL_DIM),
      this.selectedColor = Colors.white,
      this.unselectedColor = Colors.black54,
      this.activeColor = Colors.blue});

  @override
  _BottomNavBarItemState createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.isActived ? _controller.forward() : _controller.reverse();
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Transform.scale(
          child: child,
          scale: (_controller.value * 0.11) + 0.9,
        );
      },
      child: Container(
        padding: widget.isActived
            ? EdgeInsets.symmetric(
                horizontal: NORMAL_DIM_2X, vertical: NORMAL_DIM)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          // boxShadow: [NAV_ITEM_SHADOW],
          borderRadius: BorderRadius.all(Radius.circular(LARGE_DIM)),
          color: widget.isActived ? widget.activeColor : null,
        ),
        child: Row(
          children: <Widget>[
            widget.isActived
                ? Icon(
                    widget.iconData,
                    color: widget.isActived
                        ? widget.selectedColor
                        : widget.unselectedColor,
                  )
                : Container(),
            SizedBox(
              width: SMALL_DIM,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontFamily: LocaleKeys.fontfamily.tr(),
                  color: widget.isActived
                      ? widget.selectedColor
                      : widget.unselectedColor,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
