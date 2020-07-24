import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    debugPrint("[E] in [${bloc.runtimeType}]\n$space[$event]");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint("<T> in <${bloc.runtimeType}>\n$space<$transition>");
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    debugPrint("[ERROR] in [${bloc.runtimeType}]\n$space[$error\n$stacktrace]");
  }

  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
    debugPrint(
        "<Change> in <${cubit.runtimeType}>\n$space<${change.toString()}>");
  }

  String space = "       ";
}
