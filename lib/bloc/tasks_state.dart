part of 'tasks_bloc.dart';

enum TasksStatus { initial, loading, loaded, adding, added, error }

@immutable
class TasksState extends Equatable {
  final List<Task> tasks;
  final TasksStatus status;
  final Failure failure;
  const TasksState(
      {required this.tasks, required this.status, required this.failure});
  factory TasksState.initial() => TasksState(
      tasks: [Task.empty()],
      status: TasksStatus.initial,
      failure: Failure.none());

  TasksState copyWith(
          {List<Task>? tasks, TasksStatus? status, Failure? failure}) =>
      TasksState(
        tasks: tasks ?? this.tasks,
        status: status ?? this.status,
        failure: failure ?? this.failure,
      );

  @override
  List<Object?> get props => [tasks, status];

  @override
  String toString() => 'Task:$tasks';
}
