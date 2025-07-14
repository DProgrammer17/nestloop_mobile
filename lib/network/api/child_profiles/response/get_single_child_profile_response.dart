import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';

class GetSingleChildProfileResponse {
  final int? status;
  final String? message;
  final ChildData? data;

  GetSingleChildProfileResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetSingleChildProfileResponse.fromJson(Map<String, dynamic> json) => GetSingleChildProfileResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ChildData.fromJson(json["data"]),
  );
}