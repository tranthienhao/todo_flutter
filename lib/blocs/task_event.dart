import 'package:equatable/equatable.dart';
import 'package:todo_flutter/models/models.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TasksEvent {}

class CreateTask extends TasksEvent {
  final Task task;

  const CreateTask(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'CreateTask { task: $task }';
}

class RemoveTask extends TasksEvent {
  final Task task;

  const RemoveTask(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'RemoveTask { task: $task }';
}
