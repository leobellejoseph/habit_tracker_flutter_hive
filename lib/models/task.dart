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

  Task({
    required this.id,
    required this.name,
    required this.iconName,
  });
  factory Task.create({required String name, required String iconName}) =>
      Task(id: Uuid().v1(), name: name, iconName: iconName);

  factory Task.empty() => Task(id: '0', iconName: 'NA', name: 'NA');

  @override
  String toString() => 'Id: $id,Name:$name,iconName:$iconName';
}
