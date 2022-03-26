import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {}

class LoginPressed extends LoginEvent {
  @override
  List<Object> get props => [];
}

class PhoneLoginPressed extends LoginEvent {
  TextEditingController phoneController;
  PhoneLoginPressed({required this.phoneController});
  @override
  List<Object> get props => [phoneController];
}
