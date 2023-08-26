import 'package:flutter/material.dart';
import 'package:mobileapp/main.dart';
import 'package:mobileapp/navigation/app_navigator.dart';
import 'package:mobileapp/ui/task_detail/task_detail_initial_params.dart';
import 'package:mobileapp/ui/task_detail/task_detail_screen.dart';
import 'package:mobileapp/ui/task_list/task_list_initial_params.dart';
import 'package:mobileapp/ui/task_list/task_list_screen.dart';

class TaskListNavigator with TaskListRoute {
  TaskListNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  final AppNavigator navigator;
}

mixin TaskListRoute {
  openTaskDetailtPage(TaskDetailIntialParams initialParams) {
    navigator.push(
        context,
        TaskDetailScreen(
          cubit: getIt(param1: initialParams),
        ));
  }

  AppNavigator get navigator;
  BuildContext get context;
}
