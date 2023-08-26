import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileapp/resources/app_theme.dart';
import 'package:mobileapp/ui/task_detail/task_detail_cubit.dart';
import 'package:mobileapp/ui/task_detail/task_detail_state.dart';

class TaskDetailScreen extends StatefulWidget {
  final TaskDetailsCubit cubit;
  const TaskDetailScreen({super.key, required this.cubit});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  TaskDetailsCubit get taskDetailCubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    taskDetailCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: taskDetailCubit,
      builder: (context, state) {
        state as TaskDetailState;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.primaryColor,
            title: Text(state.task.taskname ?? ""),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.task.taskname ?? "",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(state.task.taskdescription ?? "",
                  style: const TextStyle(fontSize: 20)),
            ],
          )),
        );
      },
    );
  }
}
