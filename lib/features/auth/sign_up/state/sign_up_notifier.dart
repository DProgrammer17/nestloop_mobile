import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/sign_up_model.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';

final signUpNotifier = NotifierProvider<SignUpNotifier, SignUpModel>(() {
  return SignUpNotifier();
});

class SignUpNotifier extends Notifier<SignUpModel> {
  @override
  SignUpModel build() => SignUpModel(
    emailAddressController: TextEditingController(),
    fullNameController: TextEditingController(),
    passwordController: TextEditingController(),
    postCodeController: TextEditingController(),
    otpController: TextEditingController(),
    otpFocusNode: FocusNode(),
    otpFormKey: GlobalKey<FormState>(),
    createAccountFormKey: GlobalKey<FormState>(),
  );

  void validateOTP(BuildContext context) {
    if (state.otpFormKey.currentState!.validate() &&
        state.otpController.text.isNotEmpty) {
     ///otp validation action
      return;
    }
    AppMessages.showErrorMessage(
      context: context,
      message: ErrorStrings.pleaseInputValidPin,
    );
  }
}
