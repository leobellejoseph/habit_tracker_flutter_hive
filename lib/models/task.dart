import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String iconName;
  @HiveField(3)
  final bool completed;

  Task({
    required this.id,
    required this.name,
    required this.iconName,
    required this.completed,
  });
  factory Task.create({required String name, required String iconName}) =>
      Task(id: Uuid().v1(), name: name, iconName: iconName, completed: false);

  factory Task.empty() =>
      Task(id: '0', iconName: 'NA', name: 'NA', completed: false);
}
