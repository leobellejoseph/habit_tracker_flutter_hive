import 'package:flutter/foundation.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataStore {
  static const tasksBoxName = 'tasks';
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Task>(TaskAdapter());
    await Hive.openBox<Task>(tasksBoxName);
  }

  Future<void> addTasks({required List<Task> tasks, bool force = true}) async {
    final box = Hive.box<Task>(tasksBoxName);
    if (box.isEmpty || force) {
      await box.clear();
      await box.addAll(tasks);
    }
  }

  Future<void> addTask({required Task task}) async {
    final box = Hive.box<Task>(tasksBoxName);
    if (box.isEmpty) {
      await box.add(task);
    } else {
      if (box.containsKey(tasksBoxName)) {
        await box.delete(tasksBoxName);
        await box.add(task);
      }
    }
  }

  Future<List<Task>> fetchTasks() async {
    final box = Hive.box<Task>(tasksBoxName);
    if (box.isNotEmpty) {
      return box.values.toList();
    }
    return [];
  }

  ValueListenable<Box<Task>> tasksListenable() {
    return Hive.box<Task>(tasksBoxName).listenable();
  }
}
