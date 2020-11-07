import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/font_size.dart';
import 'package:mBet/utils/const/styles.dart';

class HalfButton extends StatelessWidget {
  final Function onTap;
  HalfButton({this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
        decoration: BoxDecoration(
          boxShadow: [NORMAL_SHADOW],
          color: Color(PRIMARY_COLOR),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3.0),
            bottomLeft: Radius.circular(3.0),
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            tr('login'),
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
              height: 1.5,
              fontFamily: tr('fontfamily'),
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
