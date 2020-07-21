import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// Пример с записью стейта коунтера в память

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Decrement) {
      final _value = state.value - 1;
      if (await FlutterAppBadger.isAppBadgeSupported()) {
        FlutterAppBadger.updateBadgeCount(_value);
      }

      yield CounterChanged(_value);
    } else if (event is Increment) {
      final _value = state.value + 1;
      if (await FlutterAppBadger.isAppBadgeSupported()) {
        FlutterAppBadger.updateBadgeCount(_value);
      }
      yield CounterChanged(_value);
    }
  }

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    CounterState counterState = CounterChanged(json['counter_state_value']);
    return counterState;
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    return {'counter_state_value': state.value};
  }
}
