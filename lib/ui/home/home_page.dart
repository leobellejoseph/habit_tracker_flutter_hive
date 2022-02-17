import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/bloc/tasks_bloc.dart';
import 'package:habit_tracker_flutter/persistence/hive_datastore.dart';
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
      //   onPressed: () => context.read<TasksBloc>().add(TasksClearEvent()),
      //   child: Icon(Icons.clear_all),
      // ),
    );
  }
}
