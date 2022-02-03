import 'package:flutter_bloc/flutter_bloc.dart';

class TasksObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('Error: $error -> $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('${change.currentState} => ${change.nextState}');
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    print('Bloc Created: ${bloc.state}');
    super.onCreate(bloc);
  }
}
