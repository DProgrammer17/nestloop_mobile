import 'package:flutter/material.dart';

class SignUpModel {
  final TextEditingController emailAddressController;
  final TextEditingController fullNameController;
  final TextEditingController passwordController;
  final TextEditingController postCodeController;
  final TextEditingController otpController;
  final FocusNode otpFocusNode;
  final GlobalKey<FormState> otpFormKey;
  final GlobalKey<FormState> createAccountFormKey;
  final bool signUpLoading;
  final bool verifyEmailLoading;
  final bool resendEmailLoading;
  final bool obscurePassword;

  const SignUpModel({
    required this.emailAddressController,
    required this.fullNameController,
    required this.passwordController,
    required this.postCodeController,
    required this.otpController,
    required this.otpFocusNode,
    required this.otpFormKey,
    required this.createAccountFormKey,
    this.signUpLoading = false,
    this.verifyEmailLoading = false,
    this.resendEmailLoading = false,
    this.obscurePassword = false,
  });

  SignUpModel copyWith({
    TextEditingController? emailAddressController,
    TextEditingController? fullNameController,
    TextEditingController? passwordController,
    TextEditingController? postCodeController,
    TextEditingController? otpController,
    FocusNode? otpFocusNode,
    GlobalKey<FormState>? otpFormKey,
    GlobalKey<FormState>? createAccountFormKey,
    bool? signUpLoading,
    bool? verifyEmailLoading,
    bool? resendEmailLoading,
    bool? obscurePassword,
  }) {
    return SignUpModel(
      emailAddressController:
          emailAddressController ?? this.emailAddressController,
      fullNameController: fullNameController ?? this.fullNameController,
      passwordController: passwordController ?? this.passwordController,
      postCodeController: postCodeController ?? this.postCodeController,
      otpController: otpController ?? this.otpController,
      otpFocusNode: otpFocusNode ?? this.otpFocusNode,
      otpFormKey: otpFormKey ?? this.otpFormKey,
      createAccountFormKey: createAccountFormKey ?? this.createAccountFormKey,
      verifyEmailLoading: verifyEmailLoading ?? this.verifyEmailLoading,
      signUpLoading: signUpLoading ?? this.signUpLoading,
      resendEmailLoading: resendEmailLoading ?? this.resendEmailLoading,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}
