import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorState> {
  NavigatorBloc() : super(NavigatorStartPage());

  @override
  Stream<NavigatorState> mapEventToState(
    NavigatorEvent event,
  ) async* {
    if (event is NavigateToPageA) {
      yield NavigatorPageA();
    } else if (event is NavigateToPageB) {
      yield NavigatorPageB();
    } else if (event is NavigateToStartPage) {
      yield NavigatorStartPage();
    }
  }
}
