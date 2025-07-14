import 'package:nest_loop_mobile/network/net_utils/enums/access_durations.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_levels.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/care_permissions.dart';

class PostCarerInviteRequest {
  final String careProviderId;
  final String childId;
  final List<CarePermissions> permissions;
  final AccessLevels accessType;
  final AccessDuration accessDuration;
  final String message;

  PostCarerInviteRequest({
    required this.careProviderId,
    required this.childId,
    required this.permissions,
    required this.accessType,
    required this.accessDuration,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
    "careProviderId": careProviderId,
    "childId": childId,
    "permissions": List<dynamic>.from(permissions.map((x) => x.jsonString)),
    "accessType": accessType.jsonString,
    "accessDuration": accessDuration.toJson(),
    "message": message,
  };
}

class AccessDuration {
  final AccessDurations? type;
  final DateTime? expiryDateTime;

  AccessDuration({this.type, this.expiryDateTime});

  factory AccessDuration.fromJson(Map<String, dynamic> json) => AccessDuration(
    type: (json["type"] as String?).jsonAccessDurations,
    expiryDateTime: json["expiryDateTime"] == null
        ? null
        : DateTime.tryParse(json["expiryDateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type!.jsonString,
    "expiryDateTime": expiryDateTime!.toIso8601String(),
  };
}
