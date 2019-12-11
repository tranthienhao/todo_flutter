import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/app.dart';
import 'package:todo_flutter/blocs/blocs.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<TasksBloc>(
            create: (BuildContext context) => TasksBloc()..add(LoadTasks()),
          ),
          BlocProvider<AppBloc>(
            create: (BuildContext context) => AppBloc()..add(LoadApp()),
          ),
        ],
        child: TodoApp(),
      ),
    );
