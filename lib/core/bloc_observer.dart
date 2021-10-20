import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SimpleBlocObserver extends BlocObserver {

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("onTransition $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent( bloc, event) {
    debugPrint("onEvent $event");
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("Cubit is $bloc and the change is $change");
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("Bloc Error is $error");
    super.onError(bloc, error, stackTrace);
  }
}
