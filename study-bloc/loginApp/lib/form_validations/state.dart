part of 'bloc.dart';

class FormValidationState extends Equatable {
  const FormValidationState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure});

  final Email email;
  final Password password;
  final FormzStatus status;

  FormValidationState copyWith(
      {Email email, Password password, FormzStatus status}) {
    return FormValidationState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object> get props => [email, password, status];
}
