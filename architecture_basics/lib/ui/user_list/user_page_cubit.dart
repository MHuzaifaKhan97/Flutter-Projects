import 'package:architecture_basics/domain/repository/user_repository.dart';
import 'package:architecture_basics/ui/user_list/user_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubit extends Cubit<UserListState> {
  final UserRepository userRepository;
  // Dependency Injection
  UserListCubit(this.userRepository) : super(UserListState.empty());
  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true));
    final users = await userRepository.getUsers();
    emit(state.copyWith(users: users, isLoading: false));
  }
}
