part of 'task_state_bloc.dart';

enum TaskStateStateStatus { initial, loading, loaded, adding, added, error }

class TaskStateState extends Equatable {
  final List<TaskState> taskStates;
  final TaskStateStateStatus status;
  final Failure failure;
  const TaskStateState(
      {required this.taskStates, required this.status, required this.failure});

  factory TaskStateState.initial() => TaskStateState(
      taskStates: [],
      failure: Failure.none(),
      status: TaskStateStateStatus.initial);

  @override
  List<Object> get props => [taskStates, status, failure];
}
