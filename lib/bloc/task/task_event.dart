part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}


class LoadTasksEvent extends TaskEvent {}

class CreateTaskEvent extends TaskEvent {
  final Task task;
  CreateTaskEvent(this.task);
}

