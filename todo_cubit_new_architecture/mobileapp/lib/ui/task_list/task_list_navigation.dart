import 'package:flutter/material.dart';
import 'package:mobileapp/main.dart';
import 'package:mobileapp/navigation/app_navigator.dart';
import 'package:mobileapp/ui/task_add/task_add_initial_params.dart';
import 'package:mobileapp/ui/task_add/task_add_screen.dart';
import 'package:mobileapp/ui/task_detail/task_detail_initial_params.dart';
import 'package:mobileapp/ui/task_detail/task_detail_screen.dart';

class TaskListNavigator with TaskListRoute {
  TaskListNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  final AppNavigator navigator;
}

mixin TaskListRoute {
  openTaskDetailPage(TaskDetailIntialParams initialParams) {
    navigator.push(
        context,
        TaskDetailScreen(
          cubit: getIt(param1: initialParams),
        ));
  }

  openTaskAddPage(TaskAddInitialParams initialParams, VoidCallback callback) {
    navigator.push(
        context,
        TaskAddScreen(
          cubit: getIt(param1: initialParams),
        ),
        callback: callback);
  }

  AppNavigator get navigator;
  BuildContext get context;
}
