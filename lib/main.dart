import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/bloc/bloc/tasks_bloc.dart';
import 'package:habit_tracker_flutter/constants/app_assets.dart';
import 'package:habit_tracker_flutter/constants/app_colors.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/models/task_preset.dart';
import 'package:habit_tracker_flutter/persistence/hive_datastore.dart';
import 'package:habit_tracker_flutter/ui/home/home_page.dart';
import 'package:habit_tracker_flutter/ui/theming/app_theme.dart';
import 'package:uuid/uuid.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadSVGs();
  final dataStore = HiveDataStore();
  await dataStore.init();
  runApp(MyApp(dataStore: dataStore));
}

class MyApp extends StatelessWidget {
  final HiveDataStore dataStore;
  const MyApp({required this.dataStore});
  @override
  Widget build(BuildContext context) {
    final preset = TaskPreset.allPresets[0];
    final Task task = Task.create(iconName: preset.iconName, name: preset.name);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Helvetica Neue',
      ),
      home: AppTheme(
        data: AppThemeData.defaultWithSwatch(AppColors.red),
        child: RepositoryProvider(
          create: (context) => dataStore,
          child: BlocProvider<TasksBloc>(
            create: (context) => TasksBloc(context.read<HiveDataStore>())
              ..add(TasksFetchEvent())
              ..add(TasksAddEvent(task: task)),
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
