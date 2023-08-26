import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileapp/data/rest_api_tasks_repository.dart';
import 'package:mobileapp/domain/repository/task_repository.dart';
import 'package:mobileapp/navigation/app_navigator.dart';
import 'package:mobileapp/network/network_repository.dart';
import 'package:mobileapp/ui/task_detail/task_detail_cubit.dart';
import 'package:mobileapp/ui/task_detail/task_detail_initial_params.dart';
import 'package:mobileapp/ui/task_list/task_list_cubit.dart';
import 'package:mobileapp/ui/task_list/task_list_initial_params.dart';
import 'package:mobileapp/ui/task_list/task_list_navigation.dart';
import 'package:mobileapp/ui/task_list/task_list_screen.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<NetworkRepository>(NetworkRepository());
  getIt.registerSingleton<TaskRepository>(RestApiTaskRepository(getIt()));
  getIt.registerSingleton<AppNavigator>(AppNavigator());

  getIt.registerSingleton<TaskListNavigator>(TaskListNavigator(getIt()));
  getIt.registerFactoryParam<TaskListCubit, TaskListInitialParams, dynamic>(
      (params, _) => TaskListCubit(getIt(), getIt(), params)..fetchTasks());
  getIt.registerFactoryParam<TaskDetailsCubit, TaskDetailIntialParams, dynamic>(
      (params, _) => TaskDetailsCubit(params));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(
        cubit: getIt(param1: const TaskListInitialParams()),
      ),
    );
  }
}
