import 'package:architecture_basics/ui/user_list/user_list_state.dart';
import 'package:architecture_basics/ui/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architecture_basics/ui/user_list/user_page_cubit.dart';

class UsersListPage extends StatefulWidget {
  final UserListCubit cubit;
  const UsersListPage({super.key, required this.cubit});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  UserListCubit get userListCubit => widget.cubit;
  @override
  void initState() {
    super.initState();
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
