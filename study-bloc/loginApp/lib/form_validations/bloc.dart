import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loginApp/models/models.dart';
import 'package:rxdart/rxdart.dart';

part 'event.dart';
part 'state.dart';

class FormValidationBloc
    extends Bloc<FormValidationEvent, FormValidationState> {
  FormValidationBloc() : super(const FormValidationState());

  @override
  void onTransition(
      Transition<FormValidationEvent, FormValidationState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<Transition<FormValidationEvent, FormValidationState>> transformEvents(
    Stream<FormValidationEvent> events,
    TransitionFunction<FormValidationEvent, FormValidationState> transitionFn,
  ) {
    final debounced = events
        .where((event) => event is! FormSubmitted)
        .debounceTime(const Duration(milliseconds: 300));

    return events
        .where((event) => event is FormSubmitted)
        .mergeWith([debounced]).switchMap(transitionFn);
  }

  @override
  Stream<FormValidationState> mapEventToState(
      FormValidationEvent event) async* {
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
        // Authenticate Users
        await Future<void>.delayed(const Duration(seconds: 1));
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    }
  }
}
