part of 'task_state_bloc.dart';

abstract class TaskStateEvent extends Equatable {
  const TaskStateEvent();
  @override
  List<Object> get props => [];
}

class TaskStateFetchEvent extends TaskStateEvent {
  const TaskStateFetchEvent();
  @override
  List<Object> get props => [];
}

class TaskStateAddEvent extends TaskStateEvent {
  final TaskState taskState;
  const TaskStateAddEvent({required this.taskState});
  @override
  List<Object> get props => [taskState];
}
