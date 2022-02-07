part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent {}

@immutable
class TasksFetchEvent extends TasksEvent {}

@immutable
class TasksAddEvent extends TasksEvent {
  final Task task;
  TasksAddEvent({required this.task});
}
