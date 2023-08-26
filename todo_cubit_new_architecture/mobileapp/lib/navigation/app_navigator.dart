import 'package:flutter/material.dart';

class AppNavigator {
  push(BuildContext context, Widget page, {VoidCallback? callback}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => page))
        .then((value) => callback!());
  }

  pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
