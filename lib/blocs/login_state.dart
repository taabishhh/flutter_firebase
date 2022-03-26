import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  TextEditingController phoneController;
  LoginInitial({required this.phoneController});
  @override
  List<Object> get props => [phoneController];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  String msg, route;
  LoginSuccess({required this.msg, required this.route});
  @override
  List<Object> get props => [msg,route];
}

class LoginFailure extends LoginState {
  final String msg;
  LoginFailure({required this.msg});
  @override
  List<Object> get props => [msg];
}

class CodeSent extends LoginState {
  final String message;
  CodeSent({required this.message});
  @override
  List<Object> get props => [message];
}

