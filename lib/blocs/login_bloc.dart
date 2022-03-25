import 'package:bloc/bloc.dart';
import 'package:flutter_firebase/blocs/login_event.dart';
import 'package:flutter_firebase/blocs/login_state.dart';

import '../services/google_login.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc() : super(
    (LoginInitial()),
  ){
    on<LoginPressed>((event, emit) async {
      await signInWithGoogle(event,emit);
    });
  }
}