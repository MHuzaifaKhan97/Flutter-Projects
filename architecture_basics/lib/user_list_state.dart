import 'package:architecture_basics/user_json.dart';

class UserListState {
  final List<UserJson> users;
  final bool isLoading;
  const UserListState({required this.users, required this.isLoading});

  // factory constructor helps to return value from constructor
  factory UserListState.empty() =>
      const UserListState(users: [], isLoading: false);

  UserListState copyWith({List<UserJson>? users, bool? isLoading}) =>
      UserListState(
          users: users ?? this.users, isLoading: isLoading ?? this.isLoading);
}
