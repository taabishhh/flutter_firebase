import 'package:bloc/src/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/blocs/login_event.dart';
import 'package:flutter_firebase/blocs/login_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle(LoginPressed event, Emitter<LoginState> emit) async {

  emit(LoginLoading());

  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}