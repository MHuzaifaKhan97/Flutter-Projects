import 'package:mobileapp/domain/entities/task.dart';

class TaskListState {
  final List<TaskModel> tasks;
  final bool isLoading;
  final bool? isTaskDeleted;
  final String? error;

  TaskListState(
      {required this.tasks,
      required this.isLoading,
      this.error,
      this.isTaskDeleted});

  factory TaskListState.initialize() =>
      TaskListState(tasks: [], isLoading: false);

  TaskListState copyWith(
          {List<TaskModel>? tasks,
          bool? isLoading,
          String? error,
          bool? isTaskDeleted}) =>
      TaskListState(
          tasks: tasks ?? this.tasks,
          isLoading: isLoading ?? this.isLoading,
          isTaskDeleted: isTaskDeleted ?? this.isTaskDeleted,
          error: error ?? this.error);
}
