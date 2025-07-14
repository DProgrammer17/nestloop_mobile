import 'package:dio/dio.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/network/api/auth/login/response/login_response.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/email_verification_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/google_signup_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/reset_password_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/sign_up_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/request/verify_email_request.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/response/google_signup_response.dart';
import 'package:nest_loop_mobile/network/api/auth/signUp/response/sign_up_response.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/base/base_response.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/network/exceptions/data_transformer.dart';
import 'package:nest_loop_mobile/network/net_utils/api_path.dart';
import 'package:nest_loop_mobile/network/net_utils/dio_network_provider.dart';
import 'package:nest_loop_mobile/network/net_utils/headers.dart';

abstract class SignUpApi{
  static final _tokenProvider = AppNetworkProvider();

  static Future<SignUpResponse> signUp({required SignUpRequest request}) async {
    final response = await _tokenProvider.call(
      path: ApiPath.signUp,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.requestHeader),
    );

    final res = processData((p0) => SignUpResponse.fromJson(p0), response);
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

  static Future<BaseResponse<LoginResponse>> verifyEmail({required VerifyEmailRequest request}) async {
    final response = await _tokenProvider.call(
      path: ApiPath.verifyEmail,
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

  static Future<BaseResponse> resendEmailVerification({required EmailVerificationRequest request}) async {
    final response = await _tokenProvider.call(
      path: ApiPath.resendVerificationEmail,
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