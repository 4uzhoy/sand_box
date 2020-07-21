import 'package:equatable/equatable.dart';

abstract class ListViewState<T> extends Equatable {
  final List<T> list;

  const ListViewState({this.list});
}

class InitialListViewState<T> extends ListViewState /*with AlwaysDifferent*/ {
  final List<T> initList;

  const InitialListViewState(this.initList) : super(list: initList);

  @override
  List<Object> get props => [initList];
}

class SortedList<T> extends ListViewState /*with AlwaysDifferent*/ {
  final List<T> resultList;

  const SortedList(this.resultList) : super(list: resultList);

  @override
  List<Object> get props => [resultList];
}

class FiltredBySearchList<T> extends ListViewState /*with AlwaysDifferent*/ {
  final List<T> resultList;

  const FiltredBySearchList(this.resultList) : super(list: resultList);

  @override
  List<Object> get props => [resultList];
}
