import 'package:architecture_basics/ui/user_details/user_details_initial_params.dart';
import 'package:architecture_basics/ui/user_details/user_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsState.initial());

  onInit(UserDetailsInitialParams initialParams) =>
      emit(state.copyWith(user: initialParams.user));
}
