part of 'task_state_bloc.dart';

enum TaskStateStateStatus { initial, loading, loaded, adding, added, error }

class TaskStateState extends Equatable {
  final TaskState taskState;
  final TaskStateStateStatus status;
  final Failure failure;
  const TaskStateState(
      {required this.taskState, required this.status, required this.failure});

  factory TaskStateState.initial() => TaskStateState(
      taskState: TaskState.empty('0'),
      failure: Failure.none(),
      status: TaskStateStateStatus.initial);

  @override
  List<Object> get props => [taskState, status, failure];

  TaskStateState copyWith({
    TaskState? taskState,
    TaskStateStateStatus? status,
    Failure? failure,
  }) {
    return TaskStateState(
      taskState: taskState ?? this.taskState,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
