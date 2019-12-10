import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/app.dart';
import 'package:todo_flutter/blocs/task_bloc.dart';
import 'package:todo_flutter/blocs/task_event.dart';

void main() => runApp(
      BlocProvider(
          create: (context) {
            return TasksBloc()..add(LoadTasks());
          },
          child: TodoApp()),
    );
