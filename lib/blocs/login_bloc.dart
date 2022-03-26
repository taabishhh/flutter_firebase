import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/blocs/login_event.dart';
import 'package:flutter_firebase/blocs/login_state.dart';

import '../services/google_login.dart';
import '../services/phone_login.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc() : super(
    (LoginInitial(phoneController: TextEditingController())),
  ){
    on<LoginPressed>((event, emit) async {
      await signInWithGoogle(event,emit);
    });
    on<PhoneLoginPressed>((event, emit) async {
      await phoneLogin(event,emit);
    });
  }
}