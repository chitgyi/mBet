import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/font_size.dart';
import 'package:mBet/utils/const/styles.dart';

class HalfButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 14.0),
      decoration: BoxDecoration(
        boxShadow: [NORMAL_SHADOW],
        color: Color(PRIMARY_COLOR),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3.0),
          bottomLeft: Radius.circular(3.0),
          bottomRight: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Text(
        'Login',
        style: GoogleFonts.gabriela(
          fontSize: TEXT_REGULAR_2X,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
