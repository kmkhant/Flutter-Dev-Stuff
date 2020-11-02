part of './bloc.dart';

abstract class FormValidationEvent extends Equatable {
  const FormValidationEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends FormValidationEvent {
  const EmailChanged({@required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends FormValidationEvent {
  const PasswordChanged({@required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class FormSubmitted extends FormValidationEvent {}
