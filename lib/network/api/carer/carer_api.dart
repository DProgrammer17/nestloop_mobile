import 'package:dio/dio.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/base/base_response.dart';
import 'package:nest_loop_mobile/network/api/carer/request/get_carer_query.dart';
import 'package:nest_loop_mobile/network/api/carer/request/post_carer_invite_request.dart';
import 'package:nest_loop_mobile/network/api/carer/response/care_provider_response.dart';
import 'package:nest_loop_mobile/network/api/carer/response/carer_invite_response.dart';
import 'package:nest_loop_mobile/network/exceptions/data_transformer.dart';
import 'package:nest_loop_mobile/network/net_utils/api_path.dart';
import 'package:nest_loop_mobile/network/net_utils/dio_network_provider.dart';
import 'package:nest_loop_mobile/network/net_utils/headers.dart';

abstract class CarerApi {
  static final _tokenProvider = AppNetworkProvider();

  static Future<BaseResponse<PostCarerInviteResponse>> postCarerInvite({
    required String authToken,
    required PostCarerInviteRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.postCarerInvite,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<PostCarerInviteResponse>.fromJson(
        p0,
        (json) =>
            PostCarerInviteResponse.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse<List<CareProviderResponse>>> getCareProvider({
    required String authToken,
    required GetCarerQuery query,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.getCarers,
      method: RequestMethod.get,
      queryParams: query.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<List<CareProviderResponse>>.fromJson(
        p0,
        (json) => (json as List)
            .map(
              (item) =>
                  CareProviderResponse.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
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
