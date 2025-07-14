import 'package:dio/dio.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/network/api/auth/login/request/apple_auth_request.dart';
import 'package:nest_loop_mobile/network/api/auth/login/request/google_login_request.dart';
import 'package:nest_loop_mobile/network/api/auth/login/request/login_request.dart';
import 'package:nest_loop_mobile/network/api/auth/login/response/login_response.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/email_verification_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/google_signup_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/reset_password_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/response/google_signup_response.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/base/base_response.dart';
import 'package:nest_loop_mobile/network/exceptions/data_transformer.dart';
import 'package:nest_loop_mobile/network/net_utils/api_path.dart';
import 'package:nest_loop_mobile/network/net_utils/dio_network_provider.dart';
import 'package:nest_loop_mobile/network/net_utils/headers.dart';

abstract class LoginApi {
  static final _tokenProvider = AppNetworkProvider();

  static Future<BaseResponse<LoginResponse>> login({required LoginRequest request}) async {
    final response = await _tokenProvider.call(
      path: ApiPath.login,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData(
      (p0) => BaseResponse<LoginResponse>.fromJson(
        p0,
        (json) =>
            LoginResponse.fromJson(json! as Map<String, dynamic>),
      ),
      response,
    );
    res.either(
          (left) => throw BaseError(
        error: res.left.error,
        message: res.left.message ?? ErrorStrings.exceptionMessage,
        statusCode: res.left.statusCode,
      ),
          (right) {},
    );

    return res.right;
  }

  static Future<BaseResponse<LoginResponse>> googleAuth({required GoogleSignUpRequest request}) async {
    final response = await _tokenProvider.call(
      path: ApiPath.googleAuth,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData(
          (p0) => BaseResponse<LoginResponse>.fromJson(
        p0,
            (json) =>
            LoginResponse.fromJson(json! as Map<String, dynamic>),
      ),
      response,
    );
    res.either(
          (left) => throw BaseError(
        error: res.left.error,
        message: res.left.message ?? ErrorStrings.exceptionMessage,
        statusCode: res.left.statusCode,
      ),
          (right) {},
    );

    return res.right;
  }

  static Future<GoogleSignUpResponse> appleLogin({
    required AppleAuthRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.appleLogin,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData(
      (p0) => GoogleSignUpResponse.fromJson(p0),
      response,
    );
    res.either(
      (left) => throw BaseError(
        error: res.left.error,
        message: res.left.message ?? ErrorStrings.exceptionMessage,
        statusCode: res.left.statusCode,
      ),
      (right) {},
    );

    return res.right;
  }

  static Future<BaseResponse> forgotPassword({required EmailVerificationRequest request}) async {
    final response = await _tokenProvider.call(
      path: ApiPath.forgotPassword,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData((p0) => BaseResponse.fromJson(p0, (json)=> {}), response);
    res.either(
          (left) => throw BaseError(
        error: res.left.error,
        message: res.left.message ?? ErrorStrings.exceptionMessage,
        statusCode: res.left.statusCode,
      ),
          (right) {},
    );

    return res.right;
  }

  static Future<BaseResponse> resendResetPasswordCode({required EmailVerificationRequest request}) async {
    final response = await _tokenProvider.call(
      path: ApiPath.resendResetPasswordCode,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData((p0) => BaseResponse.fromJson(p0, (json)=> {}), response);
    res.either(
          (left) => throw BaseError(
        error: res.left.error,
        message: res.left.message ?? ErrorStrings.exceptionMessage,
        statusCode: res.left.statusCode,
      ),
          (right) {},
    );

    return res.right;
  }

  static Future<BaseResponse> resetPassword({required ResetPasswordRequest request}) async {
    final response = await _tokenProvider.call(
      path: ApiPath.resendResetPasswordCode,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData((p0) => BaseResponse.fromJson(p0, (json)=> {}), response);
    res.either(
          (left) => throw BaseError(
        error: res.left.error,
        message: res.left.message ?? ErrorStrings.exceptionMessage,
        statusCode: res.left.statusCode,
      ),
          (right) {},
    );

    return res.right;
  }
}
