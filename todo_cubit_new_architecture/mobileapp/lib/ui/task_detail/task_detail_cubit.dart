import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileapp/ui/task_detail/task_detail_initial_params.dart';
import 'package:mobileapp/ui/task_detail/task_detail_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailState> {
  final TaskDetailIntialParams initialParams;
  TaskDetailsCubit(this.initialParams)
      : super(TaskDetailState.initial(initialParams: initialParams));
}
