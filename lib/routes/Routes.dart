import 'package:flutter/material.dart';
import 'package:todo_flutter/pages/Create.page.dart';
import 'package:todo_flutter/pages/Home.page.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      "/": (context) => HomePage(title: 'Todo Flutter'),
      "/create": (context) => CreatePage(title: 'Add task')
    };
  }
}
