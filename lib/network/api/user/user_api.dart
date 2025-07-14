import 'package:dio/dio.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/base/base_response.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/network/exceptions/data_transformer.dart';
import 'package:nest_loop_mobile/network/net_utils/api_path.dart';
import 'package:nest_loop_mobile/network/net_utils/dio_network_provider.dart';
import 'package:nest_loop_mobile/network/net_utils/headers.dart';

abstract class UserApi {
  static final _tokenProvider = AppNetworkProvider();

  static Future<BaseResponse<GetUserProfileResponse>> getUserData({
    required String authToken,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.getUserInfo,
      method: RequestMethod.get,
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<GetUserProfileResponse>.fromJson(
        p0,
        (json) =>
            GetUserProfileResponse.fromJson(json! as Map<String, dynamic>),
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
}
