import 'package:architecture_basics/domain/repository/user_repository.dart';
import 'package:architecture_basics/ui/user_list/user_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubit extends Cubit<UserListState> {
  final UserRepository userRepository;
  // Dependency Injection
  UserListCubit(this.userRepository) : super(UserListState.empty());
  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true, error: null));
    final userResponse = await userRepository.getUsers();
    // in fold() we map left and right both.. we have more options other than fold as well
    userResponse.fold((error) {
      // showing error dialog on UI (after adding navigation layer)
      emit(state.copyWith(error: error.error, isLoading: false));
    }, (users) {
      emit(state.copyWith(users: users, isLoading: false));
    });
  }
}
