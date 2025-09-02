import 'package:dio/dio.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/base/base_response.dart';
import 'package:nest_loop_mobile/network/api/tasks/request/create_task_request.dart';
import 'package:nest_loop_mobile/network/api/tasks/request/interact_task_request.dart';
import 'package:nest_loop_mobile/network/api/tasks/request/update_task_request.dart';
import 'package:nest_loop_mobile/network/api/tasks/response/get_tasks_response.dart';
import 'package:nest_loop_mobile/network/exceptions/data_transformer.dart';
import 'package:nest_loop_mobile/network/net_utils/api_path.dart';
import 'package:nest_loop_mobile/network/net_utils/dio_network_provider.dart';
import 'package:nest_loop_mobile/network/net_utils/headers.dart';

abstract class TaskApi {
  static final _tokenProvider = AppNetworkProvider();

  static Future<BaseResponse<GetTasksResponse>> createTask({
    required String authToken,
    required CreateTaskRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.createTasks,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
          (p0) => BaseResponse<GetTasksResponse>.fromJson(
        p0,
            (json) => GetTasksResponse.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse<List<GetTasksResponse>>> getTasks({
    required String authToken,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.getTasks,
      method: RequestMethod.get,
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
          (p0) => BaseResponse<List<GetTasksResponse>>.fromJson(
        p0,
            (json) => (json as List)
            .map((item) => GetTasksResponse.fromJson(item as Map<String, dynamic>))
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

  static Future<BaseResponse<GetTasksResponse>> getSpecificTask({
    required String authToken,
    required InteractTaskRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.getSpecificTask,
      method: RequestMethod.get,
      queryParams: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
          (p0) => BaseResponse<GetTasksResponse>.fromJson(
        p0,
            (json) => GetTasksResponse.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse<GetTasksResponse>> updateTask({
    required String authToken,
    required UpdateTaskRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.updateTasks,
      method: RequestMethod.put,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
          (p0) => BaseResponse<GetTasksResponse>.fromJson(
        p0,
            (json) => GetTasksResponse.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse<GetTasksResponse>> markTaskComplete({
    required String authToken,
    required InteractTaskRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.markTaskComplete,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
          (p0) => BaseResponse<GetTasksResponse>.fromJson(
        p0,
            (json) => GetTasksResponse.fromJson(json! as Map<String, dynamic>),
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

  static Future<BaseResponse> deleteTask({
    required String authToken,
    required InteractTaskRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.deleteTask,
      method: RequestMethod.delete,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
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

  static Future<BaseResponse<GetTasksResponse>> cancelTask({
    required String authToken,
    required InteractTaskRequest request,
  }) async {
    final response = await _tokenProvider.call(
      path: ApiPath.cancelTask,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(headers: ApiHeaders.authorizedRequestHeader(authToken)),
    );

    final res = processData(
          (p0) => BaseResponse<GetTasksResponse>.fromJson(
        p0,
            (json) => GetTasksResponse.fromJson(json! as Map<String, dynamic>),
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