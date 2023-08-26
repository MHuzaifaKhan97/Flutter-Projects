import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileapp/domain/entities/task.dart';
import 'package:mobileapp/domain/repository/task_repository.dart';
import 'package:mobileapp/ui/task_detail/task_detail_initial_params.dart';
import 'package:mobileapp/ui/task_list/task_list_initial_params.dart';
import 'package:mobileapp/ui/task_list/task_list_navigation.dart';
import 'package:mobileapp/ui/task_list/task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  // Dependecy Injection
  final TaskRepository taskRepository;
  final TaskListNavigator taskListNavigator;
  final TaskListInitialParams initialParams;

  TaskListCubit(this.taskRepository, this.taskListNavigator, this.initialParams)
      : super(TaskListState.initialize());

  Future<void> fetchTasks() async {
    emit(state.copyWith(isLoading: true, error: null));
    final taskReponse = await taskRepository.getTasks();
    taskReponse.fold(
        (l) => emit(state.copyWith(error: l.error, isLoading: false)),
        (r) => emit(state.copyWith(tasks: r, isLoading: false)));
  }

  Future<void> deleteTask(String taskId) async {
    emit(state.copyWith(isLoading: true, error: null));
    final taskReponse = await taskRepository.deleteTask(taskId);
    state.tasks.removeWhere((element) => element.id == taskId);
    taskReponse.fold(
        (l) => emit(state.copyWith(error: l.error, isLoading: false)),
        (r) => emit(state.copyWith(
              isLoading: false,
              isTaskDeleted: true,
            )));
  }

  onTapTask(TaskModel task) {
    taskListNavigator
        .openTaskDetailtPage(TaskDetailIntialParams(taskModel: task));
  }
}
