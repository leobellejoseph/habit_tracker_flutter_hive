part of 'tasks_bloc.dart';

enum TasksStatus { initial, loading, loaded, error }

@immutable
class TasksState {
  final Task task;
  final TasksStatus status;
  const TasksState({required this.task, required this.status});
  factory TasksState.initial() =>
      TasksState(task: Task.empty(), status: TasksStatus.initial);
}
