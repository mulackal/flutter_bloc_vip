


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_vip/data/model/login_responds.dart';


class LoginState extends Equatable {

  final String mobile;
  final bool ismobileValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isPasswordValid;
  final String password;
  final bool isFailure;
  final bool noNetwork;
  final String errorMessage;
  final LoginData loginData;


  const LoginState({
    @required this.mobile,
    @required this.ismobileValid,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.noNetwork,
    @required this.errorMessage,
    @required this.isSubmitting,
    @required this.isPasswordValid,
    @required this.password,
    @required this.loginData,
  });

  factory LoginState.initial() {
    return LoginState(
      mobile: '',
      ismobileValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      noNetwork: false,
      errorMessage: '',
      password: '',
      loginData: null,
      isPasswordValid: false,
    );
  }


  LoginState dataWith({
    String mobile,
    bool ismobileValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    bool noNetwork,
    String message,
    String password,
    LoginData loginData,
    bool isPasswordValid,
  }) {
    return LoginState(
      mobile: mobile ?? this.mobile,
      ismobileValid: ismobileValid ?? this.ismobileValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      noNetwork: noNetwork ?? this.noNetwork,
      errorMessage: message ?? this.errorMessage,
      loginData: loginData ?? this.loginData,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props =>
      [
        mobile,
        ismobileValid,
        isSubmitting,
        isSuccess,
        isFailure,
        noNetwork,
        errorMessage,
        loginData,
        isPasswordValid,
        password,
      ];

  @override
  String toString() {
    return '''MyFormState {
      password: $mobile,
      isSubmitting: $isSubmitting,
      isSuccess : $isSuccess,
      isFailure : $isFailure,
      noNetwork : $noNetwork,
      message : $errorMessage,
    }''';
  }
}
