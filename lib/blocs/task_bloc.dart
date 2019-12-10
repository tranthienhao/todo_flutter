import 'package:bloc/bloc.dart';
import 'package:todo_flutter/blocs/blocs.dart';
import 'package:todo_flutter/models/models.dart';
import 'package:todo_flutter/providers/providers.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TaskProvider taskProvider = new TaskProvider();
  @override
  TasksState get initialState => TasksLoading();

  @override
  void onTransition(Transition<TasksEvent, TasksState> transition) {
    super.onTransition(transition);
    print('ℹ️ === transition: $transition');
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    print('ℹ️ === error: $error');
  }

  @override
  Stream<TasksState> mapEventToState(TasksEvent event) async* {
    if (event is LoadTasks) {
      yield* _mapLoadTasksToState();
    } else if (event is CreateTask) {
      yield* _mapCreateTaskToState(event);
    } else if (event is RemoveTask) {
      yield* _mapRemoveTaskToState(event);
    }
  }

  Stream<TasksState> _mapLoadTasksToState() async* {
    try {
      final tasks = await taskProvider.loadTask();
      yield TasksLoadSuccess(tasks);
    } catch (_) {
      print('ℹ️ === _: $_');
      yield TasksLoadFail();
    }
  }

  Stream<TasksState> _mapCreateTaskToState(CreateTask event) async* {
    if (state is TasksLoadSuccess) {
      final List<Task> updatedTasks =
          List.from((state as TasksLoadSuccess).tasks)..add(event.task);
      yield TasksLoadSuccess(updatedTasks);
      taskProvider.saveTask(updatedTasks);
    }
  }

  Stream<TasksState> _mapRemoveTaskToState(RemoveTask event) async* {
    if (state is TasksLoadSuccess) {
      final updatedTasks = (state as TasksLoadSuccess)
          .tasks
          .where((task) => task.id != event.task.id)
          .toList();
      yield TasksLoadSuccess(updatedTasks);
      taskProvider.saveTask(updatedTasks);
    }
  }
}
