import 'package:mobileapp/domain/entities/task.dart';

class TaskJson {
  String? id;
  String? taskName;
  String? taskDescription;

  TaskJson({this.id, this.taskName, this.taskDescription});

  TaskJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskName = json['task_name'];
    taskDescription = json['task_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task_name'] = this.taskName;
    data['task_description'] = this.taskDescription;
    return data;
  }

  TaskModel toDomain() =>
      TaskModel(id: id, taskname: taskName, taskdescription: taskDescription);
}
