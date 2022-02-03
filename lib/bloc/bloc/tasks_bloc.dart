import 'package:bloc/bloc.dart';
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
    on<TasksAddEvent>(addTasks);
  }

  Future<void> fetchTasks(
      TasksFetchEvent event, Emitter<TasksState> emit) async {
    emit(state.copyWith(status: TasksStatus.loading));
    final tasks = await _dataStore.fetchTasks();
    print('Tasks:${tasks.length}');
    emit(state.copyWith(tasks: tasks, status: TasksStatus.loaded));
  }

  void addTasks(TasksAddEvent event, Emitter<TasksState> state) {}
}
