import 'package:rxdart/subjects.dart';

class TaskBloc {
  List<Map<String, dynamic>> data = [];
  BehaviorSubject taskStream =
      BehaviorSubject.seeded(List<Map<String, dynamic>>(0));

  Stream get taskList => taskStream.stream;

  createTask(task) {
    data.add(task);
    taskStream.sink.add(data);
  }

  removeTask(task) {
    data.remove(task);
    taskStream.sink.add(data);
  }

  dispose() {
    taskStream.sink.close();
  }
}
