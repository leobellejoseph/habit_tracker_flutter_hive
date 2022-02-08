import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid_page.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: SafeArea(
        child: TasksGridContents(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     final tasks = TaskPreset.allPresets
      //         .map(
      //           (e) => Task(
      //             id: Uuid().v1(),
      //             name: e.name,
      //             iconName: e.iconName,
      //             completed: true,
      //           ),
      //         )
      //         .toList();
      //     context.read<TasksBloc>().add(TasksAddEvent(tasks: tasks));
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
