import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class AppBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    debugPrint("[EVENT in ${bloc.runtimeType}]\n$space[$event]");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint("<TRANSITION in ${bloc.runtimeType}>\n$space<$transition>");
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    debugPrint("@ERROR in ${bloc.runtimeType}@\n$space@$error\n$stacktrace@");
  }

  String space = "        ";
}
