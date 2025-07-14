import 'package:nest_loop_mobile/network/net_utils/enums/access_durations.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_levels.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/care_permissions.dart';

class PostCarerInviteResponse {
  final String? id;
  final String? parentId;
  final String? careProviderId;
  final String? childId;
  final String? status;
  final String? computedStatus;
  final List<CarePermissions>? permissions;
  final AccessLevels? accessType;
  final AccessDuration? accessDuration;
  final String? message;
  final DateTime? accessExpiresAt;
  final DateTime? addedAt;
  final DateTime? expiresAt;
  final DateTime? acceptedAt;
  final DateTime? rejectedAt;
  final DateTime? cancelledAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PostCarerInviteResponse({
    this.id,
    this.parentId,
    this.careProviderId,
    this.childId,
    this.status,
    this.computedStatus,
    this.permissions,
    this.accessType,
    this.accessDuration,
    this.message,
    this.accessExpiresAt,
    this.addedAt,
    this.expiresAt,
    this.acceptedAt,
    this.rejectedAt,
    this.cancelledAt,
    this.createdAt,
    this.updatedAt,
  });

  factory PostCarerInviteResponse.fromJson(Map<String, dynamic> json) =>
      PostCarerInviteResponse(
        id: json["id"],
        parentId: json["parentId"],
        careProviderId: json["careProviderId"],
        childId: json["childId"],
        status: json["status"],
        computedStatus: json["computedStatus"],
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
        accessExpiresAt: json["accessExpiresAt"] == null
            ? null
            : DateTime.tryParse(json["accessExpiresAt"]),
        addedAt: json["addedAt"] == null
            ? null
            : DateTime.tryParse(json["addedAt"]),
        expiresAt: json["expiresAt"] == null
            ? null
            : DateTime.tryParse(json["expiresAt"]),
        acceptedAt: json["acceptedAt"] == null
            ? null
            : DateTime.tryParse(json["acceptedAt"]),
        rejectedAt: json["rejectedAt"] == null
            ? null
            : DateTime.tryParse(json["rejectedAt"]),
        cancelledAt: json["cancelledAt"] == null
            ? null
            : DateTime.tryParse(json["cancelledAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.tryParse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.tryParse(json["updatedAt"]),
      );
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
}
