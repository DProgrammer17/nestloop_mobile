import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/features/auth/log_in/state/login_model.dart';

final loginNotifier = NotifierProvider<LoginNotifier, LoginModel>(() {
  return LoginNotifier();
});

class LoginNotifier extends Notifier<LoginModel> {
  @override
  LoginModel build() =>
      LoginModel(emailAddressController: TextEditingController());
}
