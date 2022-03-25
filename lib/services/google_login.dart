import 'package:bloc/src/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/blocs/login_event.dart';
import 'package:flutter_firebase/blocs/login_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithGoogle(
    LoginPressed event, Emitter<LoginState> emit) async {
  try {
    emit(LoginLoading());

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    emit(LoginSuccess(msg: 'Success', route: '/home'));

    var cred = await FirebaseAuth.instance.signInWithCredential(credential);
  } on Exception catch (e) {
    print(e.toString());
    emit(LoginFailure(msg: "Login Failed"));
  }
}
