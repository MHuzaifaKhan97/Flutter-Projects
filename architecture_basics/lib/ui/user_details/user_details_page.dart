import 'package:architecture_basics/ui/user_details/user_details_cubit.dart';
import 'package:architecture_basics/ui/user_details/user_details_initial_params.dart';
import 'package:architecture_basics/ui/user_details/user_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatefulWidget {
  final UserDetailsInitialParams initialParams;
  const UserDetailsPage({super.key, required this.initialParams});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late UserDetailsCubit userDetailsCubit;
  @override
  void initState() {
    super.initState();
    // TODO: Fix this later
    userDetailsCubit = BlocProvider.of<UserDetailsCubit>(context);
    userDetailsCubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: userDetailsCubit,
          builder: (context, state) {
            state as UserDetailsState;
            return ListTile(
              title: Text(state.user.name ?? ""),
              subtitle: Text(state.user.email ?? ""),
            );
          },
        ),
      ),
    );
  }
}
