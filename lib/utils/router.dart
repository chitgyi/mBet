import 'package:flutter/material.dart';

class MRouter {
  static to(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }
}
