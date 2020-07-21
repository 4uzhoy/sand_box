import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sand_box/bloc/bottom_navigator/page_bloc.dart';

import 'pages/pages.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({
    Key key,
  }) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  PageBloc _pageBloc;

  @override
  void initState() {
    _pageBloc = PageBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PageBloc, PageState>(
        bloc: _pageBloc,
        builder: (_, state) {
          if (state is StateAlarm) return AlarmPage();
          if (state is StateWorldTime) return WorldTimePage();
          if (state is StateStopwatch) return StopwatchPage();
          if (state is StateTimer) return TimerPage();
          return SizedBox();
        },
      ),
      bottomNavigationBar: BlocBuilder<PageBloc, PageState>(
        bloc: _pageBloc,
        builder: (_, state) {
          return BottomNavigationBar(
            currentIndex: _pageBloc.currentIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).accentColor,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).backgroundColor,
                icon: Icon(
                  Icons.alarm,
                ),
                title: Text('Alarm'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).backgroundColor,
                icon: Icon(Icons.language),
                title: Text(
                  'World Time',
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).backgroundColor,
                icon: Icon(
                  Icons.timer,
                ),
                title: Text(
                  'Stopwatch',
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).backgroundColor,
                icon: Icon(
                  Icons.av_timer,
                ),
                title: Text(
                  'Timer',
                ),
              ),
            ],
            onTap: (_index) => _pageBloc.add(TapEvent(index: _index)),
          );
        },
      ),
    );
  }
}
