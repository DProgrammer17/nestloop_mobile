import 'package:flutter/material.dart';

class LoginModel{
  final TextEditingController emailAddressController;

  const LoginModel({
    required this.emailAddressController
  });

  LoginModel copyWith({
    TextEditingController? emailAddressController,
  }){
    return LoginModel(
      emailAddressController: emailAddressController ?? this.emailAddressController,
    );
  }
}