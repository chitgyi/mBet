import 'package:flutter/material.dart';
import 'package:mBet/utils/const/colors.dart';
import 'package:mBet/utils/const/illustrations.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Illustrations.login,
            ),
          ),
          Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(ACCENT_COLOR),
            ),
          )
        ],
      ),
    );
  }
}
