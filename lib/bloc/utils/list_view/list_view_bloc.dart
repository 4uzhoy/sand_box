import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class ListViewBloc<T> extends Bloc<ListViewEvent, ListViewState> {
  final List<T> list;
  ListViewBloc(this.list) : super(InitialListViewState(list));

  @override
  Stream<ListViewState> mapEventToState(
    ListViewEvent event,
  ) async* {
    if (event is ListInverted) {
      yield* _invertList(event);
    }
    if (event is SearchActivated) {
      yield* _searchInList(event);
    }
  }

  Stream<ListViewState> _invertList(ListInverted event) async* {
    final List list = event.list.reversed.toList();
    yield SortedList<T>(list);
  }

  Stream<ListViewState> _searchInList(SearchActivated event) async* {
    final List<T> list = event.list.reversed.toList();
    yield FiltredBySearchList<T>(list);
  }
}
