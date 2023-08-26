// Used when navigate from Taskdetailpage to another page
import 'package:flutter/material.dart';
import 'package:mobileapp/main.dart';
import 'package:mobileapp/navigation/app_navigator.dart';
import 'package:mobileapp/ui/task_detail/task_detail_initial_params.dart';
import 'package:mobileapp/ui/task_detail/task_detail_screen.dart';

class TaskDetailsNavigator {}

// Entry point to Taskdetailpage
mixin TaskDetailRoute {
  openTaskDetailsPage(TaskDetailIntialParams initialParams) {
    navigator.push(
        context, TaskDetailScreen(cubit: getIt(param1: initialParams)));
  }

  AppNavigator get navigator;
  BuildContext get context;
}
