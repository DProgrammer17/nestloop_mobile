import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/services/app_storage.dart';
import 'package:nest_loop_mobile/features/auth/log_in/state/login_model.dart';
import 'package:nest_loop_mobile/features/bottom_nav/ui/app_bottom_nav.dart';
import 'package:nest_loop_mobile/network/api/auth/login/login_api.dart';
import 'package:nest_loop_mobile/network/api/auth/login/request/login_request.dart';
import 'package:nest_loop_mobile/network/api/auth/login/response/login_response.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/email_verification_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/google_signup_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/reset_password_request.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';

final loginNotifier = NotifierProvider<LoginNotifier, LoginModel>(() {
  return LoginNotifier();
});

class LoginNotifier extends Notifier<LoginModel> {
  @override
  LoginModel build() => LoginModel(
    emailAddressController: TextEditingController(),
    passwordController: TextEditingController(),
    forgotPasswordCodeController: TextEditingController(),
    forgotPasswordController: TextEditingController(),
    forgotConfirmPasswordCodeController: TextEditingController(),
  );

  void updateLoginResponse(LoginResponse response) =>
      state = state.copyWith(loginResponse: () => response);

  ///APP LOGIN API CALL
  Future<void> validateLoginCall(BuildContext context) async {
    if (state.emailAddressController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty) {
      state = state.copyWith(isLoading: true);
      try {
        final response = await LoginApi.login(
          request: LoginRequest(
            email: state.emailAddressController.text,
            password: state.passwordController.text,
          ),
        );

        state = state.copyWith(isLoading: false);
        await AppStorage.setBoolPrefs(key: ConfigStrings.skipOnboarding, value: true);
        await AppStorage.setStringPrefs(key: ConfigStrings.authToken, value: response.data?.token ?? '');

        if (context.mounted) {
          state = state.copyWith(loginResponse: () => response.data);
          context.pushAndPopAllSuper(AppBottomNav());
        }
      } on BaseError catch (e) {
        state = state.copyWith(isLoading: false);
        if (context.mounted) {
          AppMessages.showErrorMessage(
            context: context,
            message: e.message.toString(),
          );
        }
      } catch (e) {
        state = state.copyWith(isLoading: false);
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
    try {
      state = state.copyWith(isLoading: true);
      // Trigger the Google Sign-In flow.
      final googleUser = await GoogleSignIn(
        scopes: ['email'],
      ).signIn().catchError((e){
        print('Google sign in exception->$e');
        state = state.copyWith(isLoading: false);
        if (context.mounted) {
          AppMessages.showErrorMessage(context: context, message: e.toString());
        }
        return null;
      });
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      debugPrint('AUTH!!!!${googleAuth.idToken}\n\n\nSERVER AUTH${googleAuth.serverAuthCode}');

      if (context.mounted) {
       await googleLogin(context, googleAuth.idToken!);
      }
    } on Exception catch (e) {
      print('exception->$e');
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
  }

  Future<void> googleLogin(BuildContext context, String id) async {
    final userRole = await AppStorage.getStringPref(
      ConfigStrings.globalUserRole,
    );

    try {
     final response = await LoginApi.googleAuth(
        request: GoogleSignUpRequest(
          idToken: id,
          role: userRole.jsonUserRoles!,
        ),
      );

      state = state.copyWith(isLoading: false);
      state = state.copyWith(isLoading: false);
      await AppStorage.setBoolPrefs(key: ConfigStrings.skipOnboarding, value: true);
      await AppStorage.setStringPrefs(key: ConfigStrings.authToken, value: response.data?.token ?? '');

      if (context.mounted) {
        state = state.copyWith(loginResponse: () => response.data);
        context.pushAndPopAllSuper(AppBottomNav());
      }
    } on BaseError catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
  }

  Future<void> sendForgotPasswordOTP(BuildContext context) async {
    state = state.copyWith(resendLoading: true);
    try {
      final response = await LoginApi.forgotPassword(
        request: EmailVerificationRequest(
          email: state.emailAddressController.text,
        ),
      );

      state = state.copyWith(resendLoading: false);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
      }
    } on BaseError catch (e) {
      state = state.copyWith(resendLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(resendLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }

  Future<void> resendForgotPasswordOTP(BuildContext context) async {
    state = state.copyWith(resendLoading: true);
    try {
      final response = await LoginApi.resendResetPasswordCode(
        request: EmailVerificationRequest(
          email: state.emailAddressController.text,
        ),
      );

      state = state.copyWith(resendLoading: false);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
      }
    } on BaseError catch (e) {
      state = state.copyWith(resendLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(resendLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }

  Future<void> resetPasswordOTP(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await LoginApi.resetPassword(
        request: ResetPasswordRequest(
          email: state.emailAddressController.text,
          code: state.forgotPasswordCodeController.text,
          newPassword: state.forgotPasswordCodeController.text,
          confirmPassword: state.forgotConfirmPasswordCodeController.text,
        ),
      );

      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        context.popSuper();
        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
      }
    } on BaseError catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }
}
