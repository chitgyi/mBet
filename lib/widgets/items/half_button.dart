import 'package:flutter/material.dart';
import 'package:mBet/generated/locale_keys.g.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/const/font_size.dart';
import 'package:mBet/utils/const/styles.dart';
import 'package:easy_localization/easy_localization.dart';

class HalfButton extends StatelessWidget {
  final Function onTap;
  final String title;
  HalfButton({
    this.onTap,
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: NORMAL_DIM_3X,
        ),
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
          child: SizedBox(
            width: 100,
            height: 50,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: TEXT_REGULAR_2X,
                  fontFamily: LocaleKeys.fontfamily.tr(),
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
