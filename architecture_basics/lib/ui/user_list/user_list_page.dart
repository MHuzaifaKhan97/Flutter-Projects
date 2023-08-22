import 'package:architecture_basics/ui/user_details/user_details_initial_params.dart';
import 'package:architecture_basics/ui/user_details/user_details_page.dart';
import 'package:architecture_basics/ui/user_list/user_list_initial_params.dart';
import 'package:architecture_basics/ui/user_list/user_list_state.dart';
import 'package:architecture_basics/ui/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architecture_basics/ui/user_list/user_page_cubit.dart';

class UsersListPage extends StatefulWidget {
  final UserListInitialParams initialParams;
  const UsersListPage({super.key, required this.initialParams});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  late UserListCubit userListCubit;
  @override
  void initState() {
    super.initState();
    userListCubit = BlocProvider.of<UserListCubit>(context);
    //TODO: improve this
    userListCubit.userListNavigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Architecture Basics"),
      ),
      body: Center(
        child: BlocBuilder(
          bloc: userListCubit,
          builder: (context, state) {
            final userState = state as UserListState;
            return userState.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    padding: const EdgeInsets.only(top: 8),
                    children: userState.users
                        .map(
                          (user) => UserCard(
                              user: user,
                              onTap: () => userListCubit.onTapUser(user)),
                        )
                        .toList(),
                  );
          },
        ),
      ),
    );
  }
}
