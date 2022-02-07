import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_datastore.dart';
import 'package:meta/meta.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final HiveDataStore _dataStore;
  TasksBloc(HiveDataStore dataStore)
      : _dataStore = dataStore,
        super(TasksState.initial()) {
    on<TasksFetchEvent>(fetchTasks);
    on<TasksAddEvent>(addTask);
  }

  Future<void> fetchTasks(
      TasksFetchEvent event, Emitter<TasksState> emit) async {
    emit(state.copyWith(status: TasksStatus.loading));
    final tasks = await _dataStore.fetchTasks();
    emit(state.copyWith(tasks: tasks, status: TasksStatus.loaded));
  }

  Future<void> addTask(TasksAddEvent event, Emitter<TasksState> emit) async {
    emit(state.copyWith(status: TasksStatus.adding));
    await _dataStore.addTask(task: event.task);
    emit(state.copyWith(status: TasksStatus.loaded));
  }
}
