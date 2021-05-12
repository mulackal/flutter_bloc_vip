import 'package:flutter_bloc/flutter_bloc.dart';
/*
 * Copyright (c) 2021, Vipin.
 */
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    print('Error: $error');
    super.onError(bloc, error, stacktrace);
  }

}
