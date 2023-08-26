import 'package:flutter/material.dart';
import 'package:mobileapp/domain/entities/task.dart';
import 'package:mobileapp/resources/app_theme.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {super.key,
      required this.task,
      required this.onTap,
      required this.onDelete});
  final TaskModel task;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            task.taskname ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          subtitle:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(task.taskdescription ?? "",
                style: const TextStyle(fontSize: 13)),
          ]),
          // leading: CircleAvatar(
          //     backgroundColor: AppTheme.primaryColor,
          //     child: Text(task.taskname![0])),
          trailing: InkWell(
            onTap: onDelete,
            child: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
