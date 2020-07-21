import 'package:equatable/equatable.dart';

abstract class ListViewEvent extends Equatable {
  const ListViewEvent();
}

class ListInverted<T> extends ListViewEvent {
  final List<T> list;
  const ListInverted(this.list);

  @override
  List<Object> get props => [list];
}

class SearchActivated<T> extends ListViewEvent {
  final List<T> list;
  const SearchActivated(this.list);

  @override
  List<Object> get props => [list];
}
