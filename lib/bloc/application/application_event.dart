part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();
}

class LoggedIn extends ApplicationEvent {
  const LoggedIn();
}

class CheckedNewVersion extends ApplicationEvent {
  const CheckedNewVersion();
}

class LoggedOut extends ApplicationEvent {
  const LoggedIn();
}