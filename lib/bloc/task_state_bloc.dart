import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_tracker_flutter/bloc/tasks_bloc.dart';
import 'package:habit_tracker_flutter/models/failure.dart';
import 'package:habit_tracker_flutter/models/task_state.dart';

part 'task_state_event.dart';
part 'task_state_state.dart';

class TaskStateBloc extends Bloc<TaskStateEvent, TaskStateState> {
  TaskStateBloc() : super(TaskStateState.initial()) {
    on<TaskStateFetchEvent>(fetchTaskStates);
    on<TaskStateAddEvent>(addTaskState);
  }

  Future<void> fetchTaskStates(
      TaskStateFetchEvent event, Emitter<TaskStateState> emit) async {}

  Future<void> addTaskState(
      TaskStateAddEvent event, Emitter<TaskStateState> emit) async {}
}
