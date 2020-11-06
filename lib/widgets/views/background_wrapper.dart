import 'package:flutter/material.dart';
import 'package:mBet/utils/const/illustrations.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  BackgroundWrapper({
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            Illustrations.bg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: child,
          ),
        ],
      ),
    );
  }
}
