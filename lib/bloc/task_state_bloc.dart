import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_tracker_flutter/models/failure.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/models/task_state.dart';
import 'package:habit_tracker_flutter/persistence/hive_datastore.dart';

part 'task_state_event.dart';
part 'task_state_state.dart';

class TaskStateBloc extends Bloc<TaskStateEvent, TaskStateState> {
  final HiveDataStore _dataStore;
  TaskStateBloc({required HiveDataStore dataStore})
      : _dataStore = dataStore,
        super(TaskStateState.initial()) {
    on<TaskStateFetchEvent>(fetchTaskStates);
    on<TaskStateAddEvent>(addTaskState);
  }

  Future<void> fetchTaskStates(
      TaskStateFetchEvent event, Emitter<TaskStateState> emit) async {
    try {
      emit(state.copyWith(status: TaskStateStateStatus.loading));
      final taskState = await _dataStore.fetchTaskState(taskId: event.taskId);
      print(taskState);
      emit(state.copyWith(
          taskState: taskState, status: TaskStateStateStatus.loaded));
    } catch (e) {
      final fail = Failure(code: 'fetchTaskStates', message: e.toString());
      emit(state.copyWith(
          taskState: TaskState.empty(event.taskId),
          status: TaskStateStateStatus.error,
          failure: fail));
    }
  }

  Future<void> addTaskState(
      TaskStateAddEvent event, Emitter<TaskStateState> emit) async {
    final taskState = TaskState(taskId: event.task.id, completed: true);
    try {
      emit(state.copyWith(status: TaskStateStateStatus.loading));
      await _dataStore.setTaskState(task: event.task, completed: true);
      emit(state.copyWith(
          taskState: taskState, status: TaskStateStateStatus.loaded));
    } catch (e) {
      final fail = Failure(code: 'addTaskState', message: e.toString());
      emit(state.copyWith(
          taskState: taskState,
          status: TaskStateStateStatus.error,
          failure: fail));
    }
  }
}
