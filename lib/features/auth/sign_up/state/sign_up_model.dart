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

  const SignUpModel({
    required this.emailAddressController,
    required this.fullNameController,
    required this.passwordController,
    required this.postCodeController,
    required this.otpController,
    required this.otpFocusNode,
    required this.otpFormKey,
    required this.createAccountFormKey,
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
    );
  }
}
