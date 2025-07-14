import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';

class GetChildProfilesResponse {
  final int? status;
  final String? message;
  final List<ChildData>? data;

  GetChildProfilesResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetChildProfilesResponse.fromJson(Map<String, dynamic> json) => GetChildProfilesResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ChildData>.from((json["data"] as List<dynamic>).map((x) => ChildData.fromJson(x)),),
  );
}
