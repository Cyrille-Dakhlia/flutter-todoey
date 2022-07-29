import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        itemBuilder: (BuildContext context, int index) {
          final task = taskData.tasksList[index];
          return TaskTile(
            longPressCallback: () => taskData.removeTask(task),
            title: task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkboxState) => taskData.toggleIsDone(task),
          );
        },
        itemCount: taskData.taskCount,
      ),
    );
  }
}
