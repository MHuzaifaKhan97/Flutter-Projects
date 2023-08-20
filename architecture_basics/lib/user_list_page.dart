import 'package:architecture_basics/user_list_state.dart';
import 'package:architecture_basics/user_page_cubit.dart';
import 'package:architecture_basics/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:architecture_basics/user_json.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Architecture Basics"),
      ),
      body: Center(
        child: BlocBuilder<UserListCubit, UserListState>(
          bloc: BlocProvider.of<UserListCubit>(context),
          builder: (context, state) {
            final userState = state as UserListState;
            return userState.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    padding: const EdgeInsets.only(top: 8),
                    children: userState.users
                        .map((user) => UserCard(user: user))
                        .toList());
          },
        ),
      ),
    );
  }
}
