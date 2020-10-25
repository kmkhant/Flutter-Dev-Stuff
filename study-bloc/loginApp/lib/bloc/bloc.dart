import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loginApp/models/models.dart';
import 'package:rxdart/rxdart.dart';

part 'event.dart';
part 'state.dart';

class LoginAppBloc extends Bloc<AppEvent, AppState> {
  LoginAppBloc() : super(const AppState());

  @override
  void onTransition(Transition<AppEvent, AppState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<Transition<AppEvent, AppState>> transformEvents(
    Stream<AppEvent> events,
    TransitionFunction<AppEvent, AppState> transitionFn,
  ) {
    final debounced = events
        .where((event) => event is! FormSubmitted)
        .debounceTime(const Duration(milliseconds: 300));

    return events
        .where((event) => event is FormSubmitted)
        .mergeWith([debounced]).switchMap(transitionFn);
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
          email: email, status: Formz.validate([email, state.password]));
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      yield state.copyWith(
          password: password, status: Formz.validate([state.email, password]));
    } else if (event is FormSubmitted) {
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        await Future<void>.delayed(const Duration(seconds: 1));
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    }
  }
}
