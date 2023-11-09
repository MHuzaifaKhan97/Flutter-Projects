import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileapp/resources/app_theme.dart';
import 'package:mobileapp/resources/validators.dart';
import 'package:mobileapp/ui/task_add/task_add_cubit.dart';
import 'package:mobileapp/ui/task_add/task_add_state.dart';

class TaskAddScreen extends StatefulWidget {
  final TaskAddCubit cubit;
  const TaskAddScreen({super.key, required this.cubit});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {
  TaskAddCubit get taskAddCubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    taskAddCubit.taskkAddNavigator.context = context;
    taskAddCubit.onEditInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title: taskAddCubit.initialParams.isEdit
              ? const Text("Update Task")
              : const Text("Add Task")),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: BlocConsumer(
          listener: (context, state) {
            state as TaskAddState;
            if (state.isTaskAdded ?? false) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppTheme.primaryColor,
                  content: Text(
                    "Task Succesfully Added",
                    style: TextStyle(color: AppTheme.colorWhite),
                  )));
            }
          },
          bloc: taskAddCubit,
          builder: (context, state) {
            return Form(
              key: taskAddCubit.addTaskFormKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: taskAddCubit.titleController,
                      validator: valdiateTitle,
                      decoration:
                          const InputDecoration(hintText: "Enter Task Title"),
                    ),
                    TextFormField(
                      controller: taskAddCubit.descController,
                      validator: valdiateDescription,
                      decoration: const InputDecoration(
                        hintText: "Enter Task Description",
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            // backgroundColor: AppTheme.primaryColor,
                            ),
                        onPressed: () => taskAddCubit.initialParams.isEdit
                            ? taskAddCubit.onTapEditTask()
                            : taskAddCubit.onTapAddTask(),
                        child: taskAddCubit.state.isLoading
                            ? CircularProgressIndicator(
                                color: AppTheme.colorWhite,
                              )
                            : taskAddCubit.initialParams.isEdit
                                ? const Text("Edit Task")
                                : const Text("Add Task"))
                  ]),
            );
          },
        ),
      )),
    );
  }
}
