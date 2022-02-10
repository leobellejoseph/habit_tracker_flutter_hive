import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_tracker_flutter/models/failure.dart';
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
      final taskState = await _dataStore.fetchTaskState();
      emit(state.copyWith(
          taskState: taskState, status: TaskStateStateStatus.loaded));
    } catch (e) {
      final fail = Failure(code: 'Task State', message: e.toString());
      emit(state.copyWith(
          taskState: TaskState.empty(),
          status: TaskStateStateStatus.error,
          failure: fail));
    }
  }

  Future<void> addTaskState(
      TaskStateAddEvent event, Emitter<TaskStateState> emit) async {}
}
