part of 'bloc.dart';

class AppState extends Equatable {
  const AppState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure});

  final Email email;
  final Password password;
  final FormzStatus status;

  AppState copyWith({Email email, Password password, FormzStatus status}) {
    return AppState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object> get props => [email, password, status];
}
