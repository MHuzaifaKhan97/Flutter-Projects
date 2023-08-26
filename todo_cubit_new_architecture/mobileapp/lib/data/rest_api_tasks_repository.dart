import 'package:dartz/dartz.dart';
import 'package:mobileapp/data/task_json.dart';
import 'package:mobileapp/domain/entities/task.dart';
import 'package:mobileapp/domain/failure/task_add_failure.dart';
import 'package:mobileapp/domain/failure/task_delete_failure.dart';
import 'package:mobileapp/domain/failure/task_list_failure.dart';
import 'package:mobileapp/domain/repository/task_repository.dart';
import 'package:mobileapp/network/network_repository.dart';
import 'package:mobileapp/resources/paths.dart';

class RestApiTaskRepository implements TaskRepository {
  final NetworkRepository _networkRepository;
  RestApiTaskRepository(this._networkRepository);
  @override
  Future<Either<TaskListFailure, List<TaskModel>>> getTasks() =>
      _networkRepository.get(Paths.baseURL).then((value) =>
          // return left() for failure
          value.fold((l) => left(TaskListFailure(error: l.error)), (r) {
            var list = r as List;
            // return right() for success
            return right(
                list.map((e) => TaskJson.fromJson(e).toDomain()).toList());
          }));
  @override
  Future<Either<TaskDeleteFailure, dynamic>> deleteTask(String taskId) =>
      _networkRepository.delete('${Paths.baseURL}/$taskId').then((value) =>
          value.fold(
              (l) => left(TaskDeleteFailure(error: l.error)), (r) => right(r)));

  @override
  Future<Either<TasAddFailure, dynamic>> addTask(
          String title, String description) =>
      _networkRepository.post(Paths.baseURL, {
        "task_name": title,
        "task_description": description,
      }).then((value) => value.fold(
          (l) => left(TasAddFailure(error: l.error)), (r) => right(r)));
}
