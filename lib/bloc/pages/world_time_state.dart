part of 'world_time_bloc.dart';

abstract class WorldTimeState extends Equatable {
  const WorldTimeState();
}

class InitWorldTime extends WorldTimeState {
  InitWorldTime();

  @override
  List<Object> get props => [];
}

class WorldTimeTimer extends WorldTimeState {
  final String time;

  WorldTimeTimer(this.time);

  @override
  List<Object> get props => [time];
}
