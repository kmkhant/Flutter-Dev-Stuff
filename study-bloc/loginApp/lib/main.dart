import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginApp/form_validations/bloc.dart';
import 'package:formz/formz.dart';
import 'package:user_repository/user_repository.dart';

import 'app.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
