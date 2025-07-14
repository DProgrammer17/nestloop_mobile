import 'package:dio/dio.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/base/base_response.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/create_child_profile_request.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/delete_child_docs_request.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/delete_child_profile_request.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/get_child_documents_request.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/post_child_docs_request.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/update_child_profile_request.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/response/get_child_care_provider_response.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/network/exceptions/data_transformer.dart';
import 'package:nest_loop_mobile/network/net_utils/api_path.dart';
import 'package:nest_loop_mobile/network/net_utils/dio_network_provider.dart';
import 'package:nest_loop_mobile/network/net_utils/headers.dart';

abstract class ChildProfileApi {
  static final _tokenProvider = AppNetworkProvider();

  static Future<BaseResponse<ChildData>> createChildProfile({
    required String authToken,
    required CreateChildProfileRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.postChildProfile,
      method: RequestMethod.post,
      body: request.toFormData(),
      options: Options(headers: ApiHeaders.authorizedRequestFormDataHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<ChildData>.fromJson(
        p0,
        (json) => ChildData.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse<List<ChildData>>> getChildProfiles({
    required String authToken,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.getChildProfiles,
      method: RequestMethod.get,
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<List<ChildData>>.fromJson(
        p0,
        (json) => (json as List)
            .map((item) => ChildData.fromJson(item as Map<String, dynamic>))
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

  static Future<BaseResponse<ChildData>> getSingleChildProfile({
    required String authToken,
    required GetChildDocsRequest query,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.getSingleChildProfile,
      method: RequestMethod.get,
      queryParams: query.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<ChildData>.fromJson(
        p0,
        (json) => ChildData.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse<ChildData>> updateChildProfile({
    required String authToken,
    required UpdateChildProfileRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.putChildProfile,
      method: RequestMethod.put,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<ChildData>.fromJson(
        p0,
        (json) => ChildData.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse<ChildData>> deleteChildProfile({
    required String authToken,
    required DeleteChildProfileRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.deleteChildProfile,
      method: RequestMethod.delete,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<ChildData>.fromJson(
        p0,
        (json) => ChildData.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse<Document>> uploadChildDocs({
    required String authToken,
    required PostChildDocsRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.postChildDocs,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<Document>.fromJson(
        p0,
        (json) => Document.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse<Document>> getChildDocs({
    required String authToken,
    required GetChildDocsRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.getChildDocs,
      method: RequestMethod.get,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<Document>.fromJson(
        p0,
        (json) => Document.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse> deleteChildDocs({
    required String authToken,
    required DeleteChildDocsRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.deleteChildDocs,
      method: RequestMethod.delete,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse.fromJson(p0, (json) => {}),
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

  static Future<BaseResponse<List<ChildCareProviderResponse>>>
  getChildCareProviders({
    required String authToken,
    required GetChildDocsRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.getChildCareProviders,
      method: RequestMethod.get,
      queryParams: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
      (p0) => BaseResponse<List<ChildCareProviderResponse>>.fromJson(
        p0,
        (json) => (json as List)
            .map(
              (item) => ChildCareProviderResponse.fromJson(
                item as Map<String, dynamic>,
              ),
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
