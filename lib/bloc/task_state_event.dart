part of 'task_state_bloc.dart';

abstract class TaskStateEvent extends Equatable {
  const TaskStateEvent();
  @override
  List<Object> get props => [];
}

class TaskStateFetchEvent extends TaskStateEvent {
  final String taskId;
  const TaskStateFetchEvent({required this.taskId});
  @override
  List<Object> get props => [taskId];
}

class TaskStateAddEvent extends TaskStateEvent {
  final Task task;
  const TaskStateAddEvent({required this.task});
  @override
  List<Object> get props => [task];
}
