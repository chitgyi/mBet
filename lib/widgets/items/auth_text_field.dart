import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/const/styles.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final bool isSecure;
  final IconData iconData;

  AuthTextField({
    @required this.hintText,
    @required this.iconData,
    this.isSecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AUTH_CONTAINER_WIDTH,
      height: AUTH_CONTAINER_HEIGHT,
      margin: EdgeInsets.symmetric(horizontal: NORMAL_DIM_3X),
      padding: EdgeInsets.symmetric(horizontal: NORMAL_DIM_2X),
      decoration: BoxDecoration(
        boxShadow: [TEXT_FIELD_SHADOW],
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
              obscureText: isSecure,
              style: GoogleFonts.gabriela(),
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: GoogleFonts.gabriela(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
