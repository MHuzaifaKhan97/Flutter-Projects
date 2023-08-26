import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileapp/domain/repository/task_repository.dart';
import 'package:mobileapp/ui/task_add/task_add_initial_params.dart';
import 'package:mobileapp/ui/task_add/task_add_navigation.dart';
import 'package:mobileapp/ui/task_add/task_add_state.dart';
import 'package:mobileapp/ui/task_list/task_list_cubit.dart';

class TaskAddCubit extends Cubit<TaskAddState> {
  final TaskRepository taskRepository;
  final TaskkAddNavigator taskkAddNavigator;
  final TaskAddInitialParams initialParams;
  final TaskListCubit taskListCubit;
  TaskAddCubit(this.taskRepository, this.initialParams, this.taskkAddNavigator,
      this.taskListCubit)
      : super(TaskAddState.initial());

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  GlobalKey<FormState> addTaskFormKey = GlobalKey<FormState>();
  onTapAddTask() {
    if (addTaskFormKey.currentState?.validate() ?? false) {
      addTask();
    }
  }

  Future<void> addTask() async {
    emit(state.copyWith(isLoading: true, error: null));
    final taskReponse =
        await taskRepository.addTask(titleController.text, descController.text);
    taskReponse.fold(
        (l) => emit(state.copyWith(error: l.error, isLoading: false)), (r) {
      emit(state.copyWith(isLoading: false, isTaskAdded: true));
      titleController.clear();
      descController.clear();
      navigateback();
    });
  }

  navigateback() async {
    await taskkAddNavigator.goBack();
    await taskListCubit.fetchTasks();
  }
}
