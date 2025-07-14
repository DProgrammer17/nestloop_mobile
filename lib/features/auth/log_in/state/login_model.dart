import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/network/api/auth/login/response/login_response.dart';

class LoginModel{
  final TextEditingController emailAddressController;
  final TextEditingController passwordController;
  final TextEditingController forgotPasswordCodeController;
  final TextEditingController forgotPasswordController;
  final TextEditingController forgotConfirmPasswordCodeController;
  final LoginResponse? loginResponse;
  final bool isLoading;
  final bool resendLoading;

  const LoginModel({
    required this.emailAddressController,
    required this.passwordController,
    required this.forgotPasswordCodeController,
    required this.forgotPasswordController,
    required this.forgotConfirmPasswordCodeController,
    this.isLoading = false,
    this.resendLoading = false,
    this.loginResponse,
  });

  LoginModel copyWith({
    TextEditingController? emailAddressController,
    TextEditingController? passwordController,
    TextEditingController? forgotPasswordCodeController,
    TextEditingController? forgotPasswordController,
    TextEditingController? forgotConfirmPasswordCodeController,
    LoginResponse? Function()? loginResponse,
    bool? isLoading,
    bool? resendLoading,
  }){
    return LoginModel(
      emailAddressController: emailAddressController ?? this.emailAddressController,
      passwordController: passwordController ?? this.passwordController,
      forgotPasswordCodeController: forgotPasswordCodeController ?? this.forgotPasswordCodeController,
      forgotPasswordController: forgotPasswordController ?? this.forgotPasswordController,
      forgotConfirmPasswordCodeController: forgotConfirmPasswordCodeController ?? this.forgotConfirmPasswordCodeController,
      loginResponse: loginResponse != null ? loginResponse() : this.loginResponse,
      isLoading: isLoading ?? this.isLoading,
      resendLoading: resendLoading ?? this.resendLoading,
    );
  }
}