
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final List<Task> tasks = [];

  TaskBloc() : super(TaskInitialState()) {
    on<LoadTasksEvent>((event, emit) {
      emit(TaskLoadingState());
      try {
        emit(TaskLoadedState(tasks));
      } catch (e) {
        emit(TaskErrorState());
      }
    });

    on<CreateTaskEvent>((event, emit) {
      emit(TaskLoadingState());
      try {
        tasks.add(event.task);
        emit(TaskLoadedState(tasks));
      } catch (e) {
        emit(TaskErrorState());
      }
    });


  }
}
