import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/bloc/tasks_bloc.dart';
import 'package:habit_tracker_flutter/constants/constants.dart';
import 'package:habit_tracker_flutter/observer/tasks_observer.dart';

import 'package:habit_tracker_flutter/persistence/hive_datastore.dart';
import 'ui/ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadSVGs();
  final dataStore = HiveDataStore();
  await dataStore.init();
  BlocOverrides.runZoned(
    () => runApp(MyApp(dataStore: dataStore)),
    blocObserver: TasksObserver(),
  );
}

class MyApp extends StatelessWidget {
  final HiveDataStore dataStore;
  const MyApp({required this.dataStore});
  @override
  Widget build(BuildContext context) {
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
              ..add(TasksFetchEvent()),
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
