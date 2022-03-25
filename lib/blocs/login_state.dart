import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  String msg, route;
  LoginSuccess({required this.msg, required this.route});
  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginState {
  final String msg;
  LoginFailure({required this.msg});
  @override
  List<Object> get props => [msg];
}
