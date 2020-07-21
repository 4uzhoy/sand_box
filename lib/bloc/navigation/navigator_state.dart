part of 'navigator_bloc.dart';

abstract class NavigatorState extends Equatable {
  const NavigatorState();
}

class NavigatorStartPage extends NavigatorState {
  final String route = r'/';

  @override
  List<Object> get props => [route];
}

class NavigatorPageA extends NavigatorState {
  final String route = r'/pageB';

  @override
  List<Object> get props => [route];
}

class NavigatorPageB extends NavigatorState {
  final String route = r'/pageB';

  @override
  List<Object> get props => [route];
}
