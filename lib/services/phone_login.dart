import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/blocs/login_event.dart';
import 'package:flutter_firebase/blocs/login_state.dart';

Future<void> phoneLogin(
    PhoneLoginPressed event, Emitter<LoginState> emit) async {
  //
  print("Phone login pressed");
  emit(LoginLoading());
  Completer<LoginState> completer = Completer<LoginState>();
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: event.phoneController.text,
    verificationCompleted: (PhoneAuthCredential credential) {
      emit(LoginSuccess(
        msg: "Phone number verified",
        route: "/home",
      ));
    },
    verificationFailed: (FirebaseAuthException e)  {
      //
      emit(LoginFailure(msg: "Invalid OTP"));
      print(e.message);
    },
    codeSent: (String verificationId, int? resendToken) {
      //
      emit(CodeSent(message: "OTP sent"));
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      //
      emit(LoginFailure(msg: "OTP expired"));
    },
  );
}
