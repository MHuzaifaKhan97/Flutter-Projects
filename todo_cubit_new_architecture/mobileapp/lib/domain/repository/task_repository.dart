import 'package:dartz/dartz.dart';
import 'package:mobileapp/domain/entities/task.dart';
import 'package:mobileapp/domain/failure/task_add_failure.dart';
import 'package:mobileapp/domain/failure/task_delete_failure.dart';
import 'package:mobileapp/domain/failure/task_edit_failure.dart';
import 'package:mobileapp/domain/failure/task_list_failure.dart';

abstract class TaskRepository {
  Future<Either<TaskListFailure, List<TaskModel>>> getTasks();
  Future<Either<TaskDeleteFailure, dynamic>> deleteTask(String taskId);
  Future<Either<TasAddFailure, dynamic>> addTask(
      String title, String description);
  Future<Either<TasEditFailure, dynamic>> editTask(
      String title, String description, String taskId);
}
