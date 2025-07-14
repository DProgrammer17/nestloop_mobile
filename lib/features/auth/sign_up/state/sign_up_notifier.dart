import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/services/app_storage.dart';
import 'package:nest_loop_mobile/features/auth/log_in/state/login_notifier.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/sign_up_model.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/ui/create_your_account.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/ui/verify_your_email.dart';
import 'package:nest_loop_mobile/features/child_profile/ui/child_profile_page.dart';
import 'package:nest_loop_mobile/network/api/auth/login/login_api.dart';
import 'package:nest_loop_mobile/network/api/auth/login/response/login_response.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/email_verification_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/google_signup_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/sign_up_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/verify_email_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/signup_api.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
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

  void obscurePassword() =>
      state = state.copyWith(obscurePassword: !state.obscurePassword);

  void validateSignUpEmail(BuildContext context) {
    if (state.emailAddressController.text.isNotEmpty) {
      context.pushSuper(CreateYourAccount());
      return;
    }
    AppMessages.showErrorMessage(
      context: context,
      message: ErrorStrings.pleaseEnterEmail,
    );
  }

  ///APP SIGNUP API CALL
  Future<void> validateSignUpCall(BuildContext context) async {
    if (state.emailAddressController.text.isNotEmpty &&
        state.fullNameController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty) {
      state = state.copyWith(signUpLoading: true);
      final userRole = await AppStorage.getStringPref(
        ConfigStrings.globalUserRole,
      );
      try {
        final response = await SignUpApi.signUp(
          request: SignUpRequest(
            fullName: state.fullNameController.text,
            email: state.emailAddressController.text,
            password: state.passwordController.text,
            confirmPassword: state.passwordController.text,
            roles: [userRole.jsonUserRoles!],
          ),
        );

        state = state.copyWith(signUpLoading: false);
        if (context.mounted) {
          AppMessages.showSuccessMessage(
            context: context,
            message: response.message ?? AppStrings.success,
          );
          context.pushSuper(VerifyYourEmail());
        }
      } on BaseError catch (e) {
        state = state.copyWith(signUpLoading: false);
        if (context.mounted) {
          AppMessages.showErrorMessage(
            context: context,
            message: e.message.toString(),
          );
        }
      } catch (e) {
        state = state.copyWith(signUpLoading: false);
        if (context.mounted) {
          AppMessages.showErrorMessage(context: context, message: e.toString());
        }
      }
      return;
    }
    AppMessages.showErrorMessage(
      context: context,
      message: ErrorStrings.pleaseFillAllFields,
    );
  }

  Future<void> getGoogleCredentials(BuildContext context) async {
    state = state.copyWith(signUpLoading: true);
    try {
      // final GoogleSignIn signIn = GoogleSignIn.instance;
      // await (signIn.initialize(
      //   clientId: dotenv.env[ConfigStrings.googleSignInClientID],
      //   serverClientId: dotenv.env[ConfigStrings.googleSignInClientID],
      // ));
      // GoogleSignInAccount? res;
      // res = await signIn.attemptLightweightAuthentication();
      // res ??= await signIn.authenticate();
      //
      // if (context.mounted) {
      //   await googleSignUp(context, res.id);
      // }

      // final GoogleSignInAuthentication? googleAuth =
      //     await signIn?.authentication;
      //
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth?.accessToken,
      //   idToken: googleAuth?.idToken,
      // );
      //
      // final res = await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  Future<void> googleSignUp(BuildContext context, String id) async {
    final userRole = await AppStorage.getStringPref(
      ConfigStrings.globalUserRole,
    );

    try {
      await LoginApi.googleAuth(
        request: GoogleSignUpRequest(
          idToken: id,
          role: userRole.jsonUserRoles!,
        ),
      );

      state = state.copyWith(signUpLoading: false);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.success,
        );
        context.pushSuper(VerifyYourEmail());
      }
    } on BaseError catch (e) {
      state = state.copyWith(signUpLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(signUpLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
  }

  Future<void> validateEmailOTP(BuildContext context) async {
    if (state.otpFormKey.currentState!.validate() &&
        state.otpController.text.isNotEmpty) {
      ///otp validation action
      state = state.copyWith(verifyEmailLoading: true);
      try {
        final response = await SignUpApi.verifyEmail(
          request: VerifyEmailRequest(
            email: state.emailAddressController.text,
            code: state.otpController.text,
          ),
        );

        state = state.copyWith(verifyEmailLoading: false);
        if (context.mounted) {
          AppMessages.showSuccessMessage(
            context: context,
            message: response.message ?? AppStrings.success,
          );
          ref
              .read(loginNotifier.notifier)
              .updateLoginResponse(response.data ?? LoginResponse());
          context.pushSuper(ChildProfilePage());
        }
      } on BaseError catch (e) {
        state = state.copyWith(verifyEmailLoading: false);
        if (context.mounted) {
          AppMessages.showErrorMessage(
            context: context,
            message: e.message.toString(),
          );
        }
      } catch (e) {
        state = state.copyWith(verifyEmailLoading: false);
        if (context.mounted) {
          AppMessages.showErrorMessage(context: context, message: e.toString());
        }
      }
      return;
    }
    AppMessages.showErrorMessage(
      context: context,
      message: ErrorStrings.pleaseInputValidPin,
    );
  }

  Future<void> resendEmailOTP(BuildContext context) async {
    state = state.copyWith(resendEmailLoading: true);
    try {
      final response = await SignUpApi.resendEmailVerification(
        request: EmailVerificationRequest(
          email: state.emailAddressController.text,
        ),
      );

      state = state.copyWith(resendEmailLoading: false);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
      }
    } on BaseError catch (e) {
      state = state.copyWith(resendEmailLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(resendEmailLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }
}
