import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sand_box/model/list_model.dart';
import 'package:sand_box/sreens/list_screen.dart';

import 'bloc/app_bloc_delegate.dart';
import 'config/app_config.dart';

void mainCommon(AppConfig appConfig) {
  BlocSupervisor.delegate = AppBlocDelegate();
  runApp(MyApp(appConfig));
}

class MyApp extends StatelessWidget {
  const MyApp(this.appConfig);

  final AppConfig appConfig;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: appConfig.colorSwatch,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListModel> _list;

  @override
  void initState() {
    _list = List<ListModel>.generate(
        15,
        (int index) =>
            ListModel(index, "title", index * 100.toDouble())); // [0, 1, 4]
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        actions: <Widget>[],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("to list view"),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => ConcreteListScreen(_list))),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
