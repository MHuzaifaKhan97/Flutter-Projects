import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TaskModel extends Equatable {
  String? id;
  String? taskname;
  String? taskdescription;

  TaskModel({this.id, this.taskname, this.taskdescription});

  TaskModel.empty()
      : id = "",
        taskname = "",
        taskdescription = "";

  // On basis of props object compares
  @override
  List<Object?> get props => [
        id,
        taskname,
        taskdescription,
      ];
}
