import 'package:mobileapp/domain/entities/task.dart';
import 'package:mobileapp/ui/task_detail/task_detail_initial_params.dart';

class TaskDetailState {
  final TaskModel task;
  const TaskDetailState({required this.task});

  factory TaskDetailState.initial(
          {required TaskDetailIntialParams initialParams}) =>
      TaskDetailState(task: initialParams.taskModel);
}
