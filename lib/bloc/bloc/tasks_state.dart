part of 'tasks_bloc.dart';

enum TasksStatus { initial, loading, loaded, error }

@immutable
class TasksState extends Equatable {
  final List<Task> tasks;
  final TasksStatus status;
  const TasksState({required this.tasks, required this.status});
  factory TasksState.initial() =>
      TasksState(tasks: [Task.empty()], status: TasksStatus.initial);

  TasksState copyWith({List<Task>? tasks, TasksStatus? status}) =>
      TasksState(tasks: tasks ?? [], status: status ?? TasksStatus.initial);

  @override
  List<Object?> get props => [tasks, status];
}
