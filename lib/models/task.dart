import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String name;
  final String iconName;
  final bool completed;
  Task({
    required this.id,
    required this.name,
    required this.iconName,
    required this.completed,
  });
}
