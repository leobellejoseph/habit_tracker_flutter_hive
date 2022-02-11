import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/bloc/tasks_bloc.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class TasksGridPage extends StatelessWidget {
  const TasksGridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: SafeArea(
        child: TasksGridContents(),
      ),
    );
  }
}

class TasksGridContents extends StatelessWidget {
  const TasksGridContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          if (state.status == TasksStatus.loaded) {
            return TasksGrid(tasks: state.tasks);
          } else {
            return LayoutBuilder(
              builder: (context, size) {
                return Center(
                  child: SizedBox(
                      height: size.maxHeight / 4,
                      width: size.maxWidth / 2,
                      child: CircularProgressIndicator(color: Colors.white)),
                );
              },
            );
          }
        },
      ),
    );
  }
}
