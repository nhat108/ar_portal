import 'package:flutter/material.dart';

class AppRoutes {
  static push(BuildContext context, Widget page) {
    return Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  static replace(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => page));
  }
}
