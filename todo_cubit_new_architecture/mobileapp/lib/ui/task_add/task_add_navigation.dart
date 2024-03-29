import 'package:flutter/material.dart';
import 'package:mobileapp/navigation/app_navigator.dart';

class TaskkAddNavigator with TaskAddRoute {
  TaskkAddNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  final AppNavigator navigator;
  goBack() {
    navigator.pop(context);
  }
}

mixin TaskAddRoute {
  AppNavigator get navigator;
  BuildContext get context;
}
