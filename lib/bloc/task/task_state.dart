part of 'task_bloc.dart';

@immutable
abstract class TaskState {}


class TaskInitialState extends TaskState {}

class TaskLoadingState extends TaskState {}

class TaskLoadedState extends TaskState {
  final List<Task> tasks;
  TaskLoadedState(this.tasks);
}

class TaskErrorState extends TaskState {}

