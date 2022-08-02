import 'package:test/test.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

void main() {
  group('Task Data', () {
    test('tasks list should contain the new added Task', () {
      final taskData = TaskData();
      int initialLength = taskData.taskCount;

      const String newTaskTitle = 'A new task';
      taskData.addTask(newTaskTitle);

      expect(taskData.taskCount, initialLength + 1);
      expect(taskData.tasksList, contains(Task(name: newTaskTitle)));
    });

    test('tasks list should have the given Task removed', () {
      final taskData = TaskData();
      final initialLength = taskData.taskCount;
      const String newTaskTitle = 'Some task';
      taskData.addTask(newTaskTitle);

      final Task task = Task(name: newTaskTitle);
      taskData.removeTask(task);

      expect(taskData.taskCount, initialLength);
      expect(taskData.tasksList, isNot(contains(task)));
    });

    test('tasks list should have the given Task toggled', () {
      final taskData = TaskData();
      const String newTaskTitle = 'Some task';
      taskData.addTask(newTaskTitle);

      final addedTask =
          taskData.tasksList.firstWhere((task) => task.name == newTaskTitle);

      taskData.toggleIsDone(addedTask);
      expect(addedTask.isDone, isTrue);

      taskData.toggleIsDone(addedTask);
      expect(addedTask.isDone, isFalse);
    });
  });
}
