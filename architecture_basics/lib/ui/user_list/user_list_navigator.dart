import 'package:architecture_basics/main.dart';
import 'package:architecture_basics/navigation/app_navigator.dart';
import 'package:architecture_basics/ui/user_details/user_details_navigator.dart';
import 'package:architecture_basics/ui/user_list/user_list_initial_params.dart';
import 'package:architecture_basics/ui/user_list/user_list_page.dart';
import 'package:flutter/material.dart';

class UserListNavigator with UserDetailRoute {
  UserListNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  final AppNavigator navigator;
}

mixin UserListRoute {
  openUserListPage(UserListInitialParams initialParams) {
    navigator.push(
        context,
        UsersListPage(
          cubit: getIt(param1: initialParams),
        ));
  }

  AppNavigator get navigator;
  BuildContext get context;
}
