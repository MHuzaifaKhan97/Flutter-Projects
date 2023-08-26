import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileapp/resources/app_theme.dart';
import 'package:mobileapp/ui/task_list/task_list_cubit.dart';
import 'package:mobileapp/ui/task_list/task_list_state.dart';
import 'package:mobileapp/widgets/empty_widget.dart';
import 'package:mobileapp/widgets/task_card_widget.dart';

class TaskListScreen extends StatefulWidget {
  final TaskListCubit cubit;
  const TaskListScreen({super.key, required this.cubit});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  TaskListCubit get taskListCubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    taskListCubit.taskListNavigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text("Task App"),
      ),
      body: Center(
        child: BlocConsumer(
          bloc: taskListCubit,
          listener: (context, state) {
            state as TaskListState;
            if (state.isTaskDeleted ?? false) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppTheme.primaryColor,
                  content: Text(
                    "Task Succesfully Deleted",
                    style: TextStyle(color: AppTheme.colorWhite),
                  )));
            }
          },
          builder: (context, state) {
            // final state = state as TaskListState;
            state as TaskListState;
            return state.isLoading
                ? CircularProgressIndicator(
                    color: AppTheme.primaryColor,
                  )
                : state.tasks.isEmpty
                    ? const EmptyWidget()
                    : ListView(
                        padding: const EdgeInsets.only(top: 8),
                        children: state.tasks
                            .map(
                              (task) => TaskCard(
                                task: task,
                                onTap: () => taskListCubit.onTapTask(task),
                                onEdit: () => taskListCubit.onTapEditTask(task),
                                onDelete: () =>
                                    taskListCubit.deleteTask(task.id ?? ""),
                              ),
                            )
                            .toList(),
                      );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => taskListCubit.onTapAddTask(),
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add_task_rounded),
      ),
    );
  }
}
