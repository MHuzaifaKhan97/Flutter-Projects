import 'package:dartz/dartz.dart';
import 'package:mobileapp/data/task_delete_json.dart';
import 'package:mobileapp/data/task_json.dart';
import 'package:mobileapp/domain/entities/task.dart';
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
  Future<Either<TaskListFailure, TaskDeleteJson>> deleteTask(String taskId) =>
      _networkRepository.delete('${Paths.baseURL}/$taskId').then((value) =>
          value.fold((l) => left(TaskListFailure(error: l.error)),
              (r) => right(TaskDeleteJson.fromJson(r))));
}
