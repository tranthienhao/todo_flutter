import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/blocs/blocs.dart';
import 'package:todo_flutter/routes/Routes.dart';

class TodoApp extends StatefulWidget {
  TodoApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: state is AppLoadSuccess && state.darkMode == true
              ? Brightness.dark
              : Brightness.light,
        ),
        initialRoute: "/",
        routes: Routes.getAll(),
      );
    });
  }
}
