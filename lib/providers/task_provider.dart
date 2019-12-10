import 'dart:convert';

import 'package:todo_flutter/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TASK_KEY = 'TASK_KEY';

class TaskProvider {
  loadTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tasksJson = JsonDecoder().convert(prefs.getString(TASK_KEY));
    List<Task> tasks =
        tasksJson['tasks'].map<Task>((task) => Task.fromJson(task)).toList();
    return tasks;
  }

  void saveTask(List<Task> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tasksJson = JsonEncoder().convert({
      'tasks': tasks.map((task) => task.toJson()).toList(),
    });
    print('ℹ️ === tasksJson: $tasksJson');
    prefs.setString(TASK_KEY, tasksJson);
  }
}
