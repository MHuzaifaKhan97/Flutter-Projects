import 'package:architecture_basics/domain/entities/user.dart';

class UserListState {
  final List<User> users;
  final bool isLoading;
  final String? error;
  const UserListState(
      {required this.users, required this.isLoading, this.error});

  // factory constructor helps to return value from constructor
  factory UserListState.initial() =>
      const UserListState(users: [], isLoading: false);

  UserListState copyWith({List<User>? users, bool? isLoading, String? error}) =>
      UserListState(
          users: users ?? this.users,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
