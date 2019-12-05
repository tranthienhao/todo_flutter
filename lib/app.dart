import 'package:flutter/material.dart';
import 'package:todo_flutter/routes/Routes.dart';
import 'package:todo_flutter/themes/brightness.dart';

class TodoApp extends StatefulWidget {
  TodoApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  var brightness = Prefs.singleton();
  String theme;

  @override
  void initState() {
    super.initState();
    brightness.addListenerForPref('AppTheme', (key, value) {
      setState(() {
        theme = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: brightness.getTheme() == "Light"
            ? Brightness.light
            : Brightness.dark,
      ),
      initialRoute: "/",
      routes: Routes.getAll(),
    );
  }
}
