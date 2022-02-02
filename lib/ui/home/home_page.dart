import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_datastore.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid_page.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataStore = HiveDataStore();
    return ValueListenableBuilder(
      valueListenable: dataStore.tasksListenable(),
      builder: (_, Box<Task> box, __) {
        return TasksGridPage(
          tasks: box.values.toList(),
        );
      },
    );
  }
}
