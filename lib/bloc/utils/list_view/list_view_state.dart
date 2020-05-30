import 'package:equatable/equatable.dart';
import 'package:sand_box/bloc/always_different_mixin.dart';

abstract class ListViewState<T> extends Equatable {
  final List<T> list;

  const ListViewState({this.list});
}

class InitialListViewState<T> extends ListViewState with AlwaysDifferent {
  final List<T> initList;
  const InitialListViewState(this.initList) : super(list: initList);
  @override
  List<Object> get props => [list];
}

class SortedList<T> extends ListViewState /*with AlwaysDifferent*/ {
  final List<T> resultList;
  const SortedList(this.resultList) /*: super(list: resultList)*/;
  @override
  List<Object> get props => [resultList];
}
