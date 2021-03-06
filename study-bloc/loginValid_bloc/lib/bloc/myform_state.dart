part of 'myform_bloc.dart';

class MyFormState extends Equatable {
  const MyFormState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure});

  final Email email;
  final Password password;
  final FormzStatus status;

  @override
  // TODO: implement props
  List<Object> get props => [email, password, status];

  MyFormState copyWith({
    Email email,
    Password password,
    FormzStatus status,
  }) {
    return MyFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
