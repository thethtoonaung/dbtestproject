import 'package:debestech_course_project/common/widgets/flutter_toast.dart';
import 'package:debestech_course_project/pages/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  void handleEmailRegister() {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Username can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }
  }
}
