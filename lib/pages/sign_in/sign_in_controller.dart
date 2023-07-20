import 'package:debestech_course_project/common/values/constant.dart';
import 'package:debestech_course_project/common/widgets/flutter_toast.dart';
import 'package:debestech_course_project/global.dart';
import 'package:debestech_course_project/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
          print("email is empty");
          toastInfo(msg: "You need to fill email address");
          return;
        } else {
          print("email is $emailAddress");
        }
        if (password.isEmpty) {
          //
          print("password is empty");
          toastInfo(msg: "You need to fill password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            print("not varified");
            toastInfo(msg: 'You need to verify your email account');
            return;
          }
          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
            print("user exist");
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          //we have error getting user from firebase
          if (e.code == "user-not-found") {
            print("No user found for that email.");
            toastInfo(msg: 'No user found for that email.');
          } else if (e.code == "wrong-password") {
            print("Writng password provided for that user");
            toastInfo(msg: 'Writing password provided for that user');
          } else if (e.code == "invalid-email") {
            print("Your email format is wrong.");
            toastInfo(msg: 'Your email format is wrong.');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
