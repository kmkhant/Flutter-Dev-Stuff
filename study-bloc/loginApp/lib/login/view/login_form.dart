import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginApp/login/login.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  const SnackBar(content: Text("Authentication Failure")));
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Hello, there !",
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                EmailInput(),
                SizedBox(
                  height: 15,
                ),
                PasswordInput(),
                SizedBox(
                  height: 20,
                ),
                SignInButton()
              ],
            ),
          ),
        ));
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.bloc<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
              labelText: 'username',
              errorText: state.username.invalid ? 'invalid username' : null),
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.bloc<LoginBloc>().add(LoginPasswordChanged(password)),
          decoration: InputDecoration(
              labelText: 'password',
              errorText: state.password.invalid ? 'invalid password' : null),
        );
      },
    );
  }
}

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : MaterialButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: const Text('Login'),
                onPressed: state.status.isValidated
                    ? () {
                        context.bloc<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
              );
      },
    );
  }
}
