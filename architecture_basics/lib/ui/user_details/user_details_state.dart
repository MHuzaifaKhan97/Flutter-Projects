import 'package:architecture_basics/domain/entities/user.dart';

class UserDetailsState {
  final User user;
  const UserDetailsState({required this.user});

  // factory constructor helps to return value from constructor
  factory UserDetailsState.initial() => UserDetailsState(user: User.empty());

  UserDetailsState copyWith({User? user}) => UserDetailsState(
        user: user ?? this.user,
      );
}
