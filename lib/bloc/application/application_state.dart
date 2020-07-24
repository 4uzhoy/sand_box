part of 'application_bloc.dart';

abstract class ApplicationState extends Equatable {
  const ApplicationState();
}

class ApplicationInitial extends ApplicationState {
  @override
  List<Object> get props => [];
}

class ApplicationNotLogged extends ApplicationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ApplicationCheck extends ApplicationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
