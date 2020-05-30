import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class ListViewBloc<T> extends Bloc<ListViewEvent, ListViewState> {
  final List<T> list;
  ListViewBloc(this.list);

  @override
  ListViewState get initialState => InitialListViewState(list);

  @override
  Stream<ListViewState> mapEventToState(
    ListViewEvent event,
  ) async* {
    if (event is ListInverted) {
      yield* _invertList(event);
    }
  }

  Stream<ListViewState> _invertList(ListInverted event) async* {
    final List list = event.list.reversed.toList();
    yield SortedList<T>(list);
  }
}
