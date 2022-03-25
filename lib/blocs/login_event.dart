import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{}

class LoginPressed extends LoginEvent{
  @override
  List<Object> get props => [];
}