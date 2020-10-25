part of './bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends AppEvent {
  const EmailChanged({@required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends AppEvent {
  const PasswordChanged({@required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class FormSubmitted extends AppEvent {}
