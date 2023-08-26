import 'package:dartz/dartz.dart';
import 'package:mobileapp/data/task_delete_json.dart';
import 'package:mobileapp/domain/entities/task.dart';
import 'package:mobileapp/domain/failure/task_add_failure.dart';
import 'package:mobileapp/domain/failure/task_delete_failure.dart';
import 'package:mobileapp/domain/failure/task_list_failure.dart';

abstract class TaskRepository {
  Future<Either<TaskListFailure, List<TaskModel>>> getTasks();
  Future<Either<TaskDeleteFailure, TaskDeleteJson>> deleteTask(String taskId);
  Future<Either<TasAddFailure, dynamic>> addTask(
      String title, String description);
}
