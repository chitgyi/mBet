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
          Positioned(
            top: 0,
            child: Image.asset(
              Illustrations.bg,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: child,
          ),
        ],
      ),
    );
  }
}
