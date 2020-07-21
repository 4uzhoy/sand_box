import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sand_box/repository/world_time/world_time_repository.dart';

part 'world_time_event.dart';
part 'world_time_state.dart';

class WorldTimeBloc extends Bloc<WorldTimeEvent, WorldTimeState> {
  static WorldTimeRepository worldTimeRepository = WorldTimeRepository();

//  static StreamSubscription<DateTime> dateTimeSub = worldTimeRepository.dtSub;
  StreamSubscription<int> _tickerSubscription;

  WorldTimeBloc() : super(WorldTimeTimer(DateTime.now().toIso8601String()));

  @override
  Stream<WorldTimeState> mapEventToState(
    WorldTimeEvent event,
  ) async* {
    //  if (event is TimerTicked) _mapTimerTickedToState(event);
  }
/*
  Stream<WorldTimeState> _mapTimerTickedToState(TimerTicked tick) async* {
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: start.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
  }

  @override
  Future<void> close() {
    dateTimeSub?.cancel();
    return super.close();
  }*/
}
