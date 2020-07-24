import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sand_box/bloc/counter/counter_bloc.dart';

class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CounterBloc, CounterState>(
        cubit: _counterBloc,
        builder: (BuildContext context, CounterState state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Badge(
                padding: const EdgeInsets.all(4),
                badgeContent: Text(state.value.toString()),
                child: Text(
                  "${state.value}",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "MINUS",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    onPressed: () {
                      _counterBloc.add(Decrement());
                    },
                  ),
                  SizedBox(
                    width: 48,
                  ),
                  RaisedButton(
                    child: Text(
                      "PLUS",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    onPressed: () {
                      _counterBloc.add(Increment());
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
