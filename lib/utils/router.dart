import 'package:flutter/material.dart';

class MRouter {
  static Future to(BuildContext context, Widget screen) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => screen));
  }
}
