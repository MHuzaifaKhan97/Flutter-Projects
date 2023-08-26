import 'package:mobileapp/domain/entities/task.dart';

class TaskAddInitialParams {
  final bool isEdit;
  final TaskModel? task;
  const TaskAddInitialParams({this.task, this.isEdit = false});
}
