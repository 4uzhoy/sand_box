part of 'navigator_bloc.dart';

abstract class NavigatorEvent extends Equatable {
  const NavigatorEvent();
}

class NavigateToPageA extends NavigatorEvent {
  const NavigateToPageA();

  @override
  List<Object> get props => [];
}

class NavigateToPageB extends NavigatorEvent {
  const NavigateToPageB();

  @override
  List<Object> get props => [];
}

class NavigateToStartPage extends NavigatorEvent {
  const NavigateToStartPage();

  @override
  List<Object> get props => [];
}
