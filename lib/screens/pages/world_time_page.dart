import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sand_box/bloc/timer/timer_bloc.dart';
import 'package:sand_box/repository/world_time/world_time_repository.dart';

class WorldTimePage extends StatefulWidget {
  @override
  _WorldTimePageState createState() => _WorldTimePageState();
}

class _WorldTimePageState extends State<WorldTimePage> {
  AnimationController _controller;

  static const int kStartValue = 1;
  TimerBloc _timerBloc;
  WorldTimeRepository worldTimeRepository;

  @override
  void initState() {
    //  worldTimeRepository = WorldTimeRepository();
    //  _worldTimeBloc = WorldTimeBloc();
    super.initState();
    _timerBloc = TimerBloc(ticker: Ticker());
    _timerBloc.add(TimerStarted(duration: 20));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<TimerBloc, TimerState>(
        bloc: _timerBloc,
        builder: (BuildContext context, TimerState state) {
          final DateTime _dateTime = DateTime.now();
          final String hoursStr = _dateTime.hour.toString().padLeft(2, '0');
          final String minutesStr = _dateTime.minute.toString().padLeft(2, '0');
          final String secondsStr = _dateTime.second.toString().padLeft(2, '0');
          return Text(
            '$hoursStr:$minutesStr:$secondsStr',
            style: TextStyle(fontSize: 48),
          );
        },
      )),
    );
  }
}
