// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoey/main.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';

void main() {
  group('TasksScreen', () {
    testWidgets(
        'has initially a TasksList and a FloatingActionButton, and should have an AddTaskScreen after tapping the FloatingActionButton',
        (widgetTester) async {
      await widgetTester.pumpWidget(const MyApp());

      var fabFinder = find.byType(FloatingActionButton);
      var tasksListFinder = find.byType(TasksList);
      var addTaskScreenFinder = find.byType(AddTaskScreen);

      expect(fabFinder, findsOneWidget);
      expect(tasksListFinder, findsOneWidget);
      expect(addTaskScreenFinder, findsNothing);

      await widgetTester.tap(fabFinder);
      await widgetTester.pump();

      expect(fabFinder, findsOneWidget);
      expect(tasksListFinder, findsOneWidget);
      expect(addTaskScreenFinder, findsOneWidget);
    });

    testWidgets('should add then remove a Task', (widgetTester) async {
      await widgetTester.pumpWidget(const MyApp());

      await widgetTester.tap(find.byType(FloatingActionButton));
      await widgetTester.pumpAndSettle(); // opens the AddTaskScreen widget

      var addTaskScreenFinder = find.byType(AddTaskScreen);
      var addTaskScreenTextFieldFinder = find.descendant(
          of: addTaskScreenFinder, matching: find.byType(TextField));
      var addTaskScreenAddButtonFinder = find.descendant(
          of: addTaskScreenFinder, matching: find.byType(ElevatedButton));

      var taskTitle = 'A task';
      await widgetTester.enterText(addTaskScreenTextFieldFinder, taskTitle);
      await widgetTester.tap(addTaskScreenAddButtonFinder);
      await widgetTester.pump();

      var tasksListFinder = find.byType(TasksList);
      var addedTaskFinder =
          find.descendant(of: tasksListFinder, matching: find.text(taskTitle));
      expect(addedTaskFinder, findsOneWidget);

      await widgetTester.longPress(addedTaskFinder);
      await widgetTester.pump();

      expect(addedTaskFinder, findsNothing);
    });
  });
}
