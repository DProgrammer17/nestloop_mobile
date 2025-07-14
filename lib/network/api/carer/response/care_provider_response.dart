import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';

class CareProviderResponse {
  final String? id;
  final String? fullName;
  final String? email;
  final String? avatar;
  final List<UserRoles>? roles;
  final DateTime? createdAt;

  CareProviderResponse({
    this.id,
    this.fullName,
    this.email,
    this.avatar,
    this.roles,
    this.createdAt,
  });

  factory CareProviderResponse.fromJson(Map<String, dynamic> json) =>
      CareProviderResponse(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        avatar: json["avatar"],
        roles: json["roles"] == null
            ? []
            : List<UserRoles>.from(
                (json['roles'] as List)
                    .map((e) => (e as String?).jsonUserRoles)
                    .toList(),
              ),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );
}
