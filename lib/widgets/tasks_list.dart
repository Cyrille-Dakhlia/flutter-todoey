import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';

import '../models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      itemBuilder: (BuildContext context, int index) {
        return TaskTile(
          title: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (checkboxState) =>
              setState(() => widget.tasks[index].toggleIsDone()),
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
