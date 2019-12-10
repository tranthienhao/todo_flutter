import 'dart:convert';

import 'package:todo_flutter/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TASK_KEY = 'TASK_KEY';

class TaskProvider {
  loadTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var localTask = prefs.getString(TASK_KEY);
    if (localTask != null) {
      var tasksJson = JsonDecoder().convert(localTask);
      List<Task> tasks =
          tasksJson['tasks'].map<Task>((task) => Task.fromJson(task)).toList();
      return tasks;
    }
    return <Task>[];
  }

  void saveTask(List<Task> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tasksJson = JsonEncoder().convert({
      'tasks': tasks.map((task) => task.toJson()).toList(),
    });
    prefs.setString(TASK_KEY, tasksJson);
  }
}
