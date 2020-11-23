import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final bool isSecure;
  final IconData iconData;
  final TextEditingController controller;

  AuthTextField({
    @required this.hintText,
    @required this.iconData,
    this.isSecure = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AUTH_CONTAINER_WIDTH,
      height: AUTH_CONTAINER_HEIGHT,
      margin: EdgeInsets.symmetric(horizontal: NORMAL_DIM_3X),
      padding: EdgeInsets.symmetric(horizontal: NORMAL_DIM_2X),
      decoration: BoxDecoration(
        color: Color(ACCENT_COLOR),
        borderRadius: BorderRadius.circular(
          AUTH_CONTAINER_HEIGHT * HALF,
        ),
      ),
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: SMALL_DIM,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isSecure,
              style: TextStyle(
                fontFamily: tr('fontfamily'),
              ),
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: tr('fontfamily'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
