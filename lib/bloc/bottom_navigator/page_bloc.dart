import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(StateAlarm());
  int currentIndex = 0;

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if (event is TapEvent) {
      this.currentIndex = event.index ?? 0;
      switch (this.currentIndex) {
        case 0:
          yield StateAlarm();
          break;
        case 1:
          yield StateWorldTime();
          break;
        case 2:
          yield StateStopwatch();
          break;
        case 3:
          yield StateTimer();
          break;
      }
    }
  }
}
