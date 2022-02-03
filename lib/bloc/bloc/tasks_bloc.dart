import 'package:bloc/bloc.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:meta/meta.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState.initial()) {
    on<TasksFetchEvent>(fetchTasks);
  }

  void fetchTasks(TasksFetchEvent event, Emitter<TasksState> state) {}
}
