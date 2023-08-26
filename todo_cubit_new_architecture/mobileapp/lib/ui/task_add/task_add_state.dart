import 'package:mobileapp/domain/entities/task.dart';

class TaskAddState {
  final TaskModel? task;
  final bool isLoading;
  final bool? isTaskAdded;
  final bool? isTaskEdited;
  final String? error;
  const TaskAddState(
      {required this.task,
      required this.isLoading,
      this.isTaskAdded,
      this.isTaskEdited,
      this.error});
  factory TaskAddState.initial() =>
      TaskAddState(task: TaskModel.empty(), isLoading: false);

  TaskAddState copyWith(
          {TaskModel? task,
          bool? isLoading,
          String? error,
          bool? isTaskEdited,
          bool? isTaskAdded}) =>
      TaskAddState(
          task: task ?? this.task,
          isLoading: isLoading ?? this.isLoading,
          isTaskAdded: isTaskAdded ?? this.isTaskAdded,
          isTaskEdited: isTaskEdited ?? this.isTaskEdited,
          error: error ?? this.error);
}
