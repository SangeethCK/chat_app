import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('${bloc.runtimeType} created');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // log('[${bloc.runtimeType}]  current state: ${transition.currentState} ');
    log('[${bloc.runtimeType}]  transition: ${transition.event} ');
    // log('[${bloc.runtimeType}]  next state: ${transition.nextState} ');
  }
}
