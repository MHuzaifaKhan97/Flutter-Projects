import 'package:architecture_basics/ui/user_details/user_details_cubit.dart';
import 'package:architecture_basics/ui/user_details/user_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatefulWidget {
  final UserDetailsCubit cubit;
  const UserDetailsPage({super.key, required this.cubit});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  UserDetailsCubit get userDetailsCubit => widget.cubit;
  @override
  void initState() {
    super.initState();
    // TODO: Fix this later
    // userDetailsCubit = BlocProvider.of<UserDetailsCubit>(context);
    // userDetailsCubit.onInit();
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
