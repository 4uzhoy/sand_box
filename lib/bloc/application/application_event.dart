part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();
}

class LoggedIn extends ApplicationEvent {
  const LoggedIn();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class CheckedNewVersion extends ApplicationEvent {
  const CheckedNewVersion();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoggedOut extends ApplicationEvent {
  const LoggedOut();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
