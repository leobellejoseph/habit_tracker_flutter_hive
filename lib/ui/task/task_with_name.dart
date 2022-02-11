import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/bloc/task_state_bloc.dart';
import 'package:habit_tracker_flutter/constants/text_styles.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/ui/task/animated_task.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';

class TaskWithName extends StatelessWidget {
  final Task task;

  const TaskWithName({Key? key, required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: BlocBuilder<TaskStateBloc, TaskStateState>(
            builder: (context, state) {
              return AnimatedTask(
                iconName: task.iconName,
                completed: state.taskState.completed,
                onCompleted: (completed) {
                  final bloc = context.read<TaskStateBloc>();
                  bloc.add(TaskStateAddEvent(task: task));
                },
              );
            },
          ),
        ),
        SizedBox(height: 8.0),
        SizedBox(
          height: 39,
          child: Text(
            task.name.toUpperCase(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyles.taskName.copyWith(
              color: AppTheme.of(context).accent,
            ),
          ),
        ),
      ],
    );
  }
}
