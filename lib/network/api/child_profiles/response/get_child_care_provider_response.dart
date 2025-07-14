import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_levels.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/care_permissions.dart';

import '../../carer/request/post_carer_invite_request.dart';

class ChildCareProviderResponse {
  final ParentInfo? parent;
  final CareProvider? careProvider;
  final List<CarePermissions>? permissions;
  final AccessLevels? accessType;
  final AccessDuration? accessDuration;
  final String? message;
  final DateTime? createdAt;

  ChildCareProviderResponse({
    this.parent,
    this.careProvider,
    this.permissions,
    this.accessType,
    this.accessDuration,
    this.message,
    this.createdAt,
  });

  factory ChildCareProviderResponse.fromJson(Map<String, dynamic> json) =>
      ChildCareProviderResponse(
        parent: json["parent"] == null
            ? null
            : ParentInfo.fromJson(json["parent"]),
        careProvider: json["careProvider"] == null
            ? null
            : CareProvider.fromJson(json["careProvider"]),
        permissions: json["permissions"] == null
            ? []
            : List<CarePermissions>.from(
                (json['permissions'] as List)
                    .map((e) => (e as String?).jsonCarePermissions)
                    .toList(),
              ),
        accessType: (json["accessType"] as String?).jsonAccessLevels,
        accessDuration: json["accessDuration"] == null
            ? null
            : AccessDuration.fromJson(json["accessDuration"]),
        message: json["message"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );
}

class ParentInfo {
  final String? id;
  final String? fullName;
  final String? email;
  final Avatar? avatar;

  ParentInfo({this.id, this.fullName, this.email, this.avatar});

  factory ParentInfo.fromJson(Map<String, dynamic> json) => ParentInfo(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
  );
}

class CareProvider {
  final String? id;
  final String? fullName;
  final String? email;
  final bool? isParent;
  final Avatar? avatar;

  CareProvider({
    this.id,
    this.fullName,
    this.email,
    this.avatar,
    this.isParent = false,
  });

  factory CareProvider.fromJson(Map<String, dynamic> json) => CareProvider(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    isParent: json["isParent"],
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
  );
}
