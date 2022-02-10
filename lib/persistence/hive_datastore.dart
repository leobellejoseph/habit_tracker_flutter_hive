import 'package:flutter/foundation.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/models/task_state.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataStore {
  static const tasksBoxName = 'tasksBox';
  static const taskStateBoxName = 'taskState';
  static String taskStateKey(String key) => 'taskState/$key';
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Task>(TaskAdapter());
    Hive.registerAdapter<TaskState>(TaskStateAdapter());
    await Hive.openBox<Task>(tasksBoxName);
    await Hive.openBox<TaskState>(taskStateBoxName);
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

  Future<void> addTaskState(
      {required String taskId, required bool completed}) async {
    final box = Hive.box<TaskState>(taskStateBoxName);
    final taskState = TaskState(taskId: taskId, completed: completed);
    if (box.isEmpty) {
      await box.add(taskState);
    } else {
      if (box.containsKey(taskId)) {
        await box.delete(taskId);
        await box.add(taskState);
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

  Future<TaskState> fetchTaskState() async {
    final box = Hive.box<TaskState>(taskStateBoxName);
    if (box.isNotEmpty) {
      return box.values.toList().first;
    }
    return TaskState.empty();
  }

  ValueListenable<Box<Task>> tasksListenable() {
    return Hive.box<Task>(tasksBoxName).listenable();
  }

  ValueListenable<Box<TaskState>> taskStateListenable({required Task task}) {
    final box = Hive.box<TaskState>(taskStateBoxName);
    final keys = <String>[taskStateKey(task.id)];
    return box.listenable(keys: keys);
  }

  Future<void> setTaskState(
      {required Task task, required bool completed}) async {
    final box = Hive.box<TaskState>(taskStateBoxName);
    final taskState = TaskState(completed: completed, taskId: task.id);
    final key = taskStateKey(task.id);
    await box.put(key, taskState);
  }
}
