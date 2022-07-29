import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData with ChangeNotifier {
  final List<Task> _tasksList = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasksList => UnmodifiableListView(_tasksList);

  int get taskCount => _tasksList.length;

  void toggleIsDone(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }

  void addTask(String newTaskTitle) {
    _tasksList.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasksList.remove(task);
    notifyListeners();
  }
}
