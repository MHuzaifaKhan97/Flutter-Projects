import 'package:architecture_basics/domain/repository/user_repository.dart';
import 'package:architecture_basics/navigation/app_navigator.dart';
import 'package:architecture_basics/ui/user_details/user_details_cubit.dart';
import 'package:architecture_basics/ui/user_details/user_details_initial_params.dart';
import 'package:architecture_basics/ui/user_list/user_list_initial_params.dart';
import 'package:architecture_basics/ui/user_list/user_list_navigator.dart';
import 'package:architecture_basics/ui/user_list/user_list_page.dart';
import 'package:architecture_basics/ui/user_list/user_page_cubit.dart';
import 'package:architecture_basics/data/rest_api_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<UserRepository>(RestApiUserRepository());
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<UserListNavigator>(UserListNavigator(getIt()));
  getIt.registerFactoryParam<UserListCubit, UserListInitialParams, dynamic>(
      (params, _) => UserListCubit(getIt(), getIt(), params)..fetchUsers());

  getIt.registerFactoryParam<UserDetailsCubit, UserDetailsInitialParams,
      dynamic>((params, _) => UserDetailsCubit(params));

  // runApp(MultiBlocProvider(
  //   providers: [
  // BlocProvider(
  //   create: (context) => UserListCubit(
  //     getIt(),
  //     getIt(),
  //   )..fetchUsers(),
  // ),
  // BlocProvider(
  //   create: (context) => UserDetailsCubit(),
  // ),
  // ],
  // child: const MyApp(),
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architecture basic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersListPage(cubit: getIt(param1: const UserListInitialParams())),
    );
  }
}
