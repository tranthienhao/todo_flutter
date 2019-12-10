import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {
  final String id;
  final String title, description, priority;

  Task(
    this.title,
    this.description,
    this.priority, {
    String id,
  }) : this.id = id ?? Uuid().v4();

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        priority = json['priority'];

  Map<String, Object> toJson() {
    return {
      "title": title,
      "description": description,
      "priority": priority,
      "id": id,
    };
  }

  @override
  List<Object> get props => [id, title, description, priority];

  @override
  String toString() {
    return 'Task {title: $title, description: $description, priority: $priority ,id: $id }';
  }
}
