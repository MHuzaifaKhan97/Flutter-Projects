// Used when navigate from userdetailpage to another page
import 'package:architecture_basics/main.dart';
import 'package:architecture_basics/navigation/app_navigator.dart';
import 'package:architecture_basics/ui/user_details/user_details_initial_params.dart';
import 'package:architecture_basics/ui/user_details/user_details_page.dart';
import 'package:flutter/material.dart';

class UserDetailsNavigator {}

// Entry point to userdetailpage
mixin UserDetailRoute {
  openUserDetailsPage(UserDetailsInitialParams initialParams) {
    navigator.push(
        context, UserDetailsPage(cubit: getIt(param1: initialParams)));
  }

  AppNavigator get navigator;
  BuildContext get context;
}
