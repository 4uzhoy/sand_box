import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sand_box/bloc/utils/index.dart';
import 'package:sand_box/model/list_model.dart';
import 'package:sand_box/view_model/list_view_model.dart';

class ConcreteListScreen extends StatefulWidget {
  final List<ListModel> listViewData;

  ConcreteListScreen(this.listViewData);

  @override
  _ConcreteListScreenState createState() => _ConcreteListScreenState();
}

class _ConcreteListScreenState extends State<ConcreteListScreen> {
  ListViewBloc _listViewBloc;
  List<ListModel> _list;

  @override
  void initState() {
    super.initState();
    _listViewBloc = ListViewBloc<ListModel>(widget.listViewData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sandBoxList"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _listViewBloc.add(ListInverted(_list)),
          )
        ],
      ),
      body: BlocBuilder<ListViewBloc, ListViewState>(
        bloc: _listViewBloc,
        builder: (BuildContext context, ListViewState state) {
          if (state is SortedList<ListModel> ||
              state is InitialListViewState<ListModel>) {
            _list = state.list;
            return ListView.builder(
              itemCount: _list.length,
              itemBuilder: (BuildContext context, int index) {
                return ListViewModel(_list[index]);
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
