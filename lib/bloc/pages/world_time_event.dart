part of 'world_time_bloc.dart';

abstract class WorldTimeEvent extends Equatable {
  const WorldTimeEvent();
}

/*
class TimerTicked extends WorldTimeEvent {
  final String time;

  const TimerTicked({@required this.time});

  @override
  List<Object> get props => [time];

  @override
  String toString() => "TimerTicked { time: $time }";
}
*/

class TimerTicked extends WorldTimeEvent {
  final int duration;

  const TimerTicked({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "TimerTicked { duration: $duration }";
}
