import 'package:architecture_basics/domain/entities/user.dart';
import 'package:architecture_basics/ui/user_details/user_details_initial_params.dart';

class UserDetailsState {
  final User user;
  const UserDetailsState({required this.user});

  // factory constructor helps to return value from constructor
  factory UserDetailsState.initial(
          {required UserDetailsInitialParams initialParams}) =>
      UserDetailsState(user: initialParams.user);

  UserDetailsState copyWith({User? user}) => UserDetailsState(
        user: user ?? this.user,
      );
}
