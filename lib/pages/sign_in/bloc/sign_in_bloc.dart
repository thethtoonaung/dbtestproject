import 'package:debestech_course_project/pages/sign_in/bloc/sign_in_event.dart';
import 'package:debestech_course_project/pages/sign_in/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    //   on<EmailEvent>((event, emit) {
    //     emit(state.copyWith(email: event.email));
    //   });

    //   on<PasswordEvent>((event, emit) {
    //     emit(state.copyWith(email: event.password));
    //   });
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.password));
  }
}
