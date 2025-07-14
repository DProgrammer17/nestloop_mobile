import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';

class GoogleSignUpResponse {
  final String? token;
  final User? user;
  final bool? isNewUser;

  GoogleSignUpResponse({this.token, this.user, this.isNewUser});

  factory GoogleSignUpResponse.fromJson(Map<String, dynamic> json) =>
      GoogleSignUpResponse(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        isNewUser: json["isNewUser"],
      );
}

class User {
  final String? id;
  final String? fullName;
  final String? email;
  final List<UserRoles>? roles;
  final bool? isEmailVerified;
  final String? avatar;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.fullName,
    this.email,
    this.roles,
    this.isEmailVerified,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    roles: json["roles"] == null
        ? []
        : List<UserRoles>.from(
            (json['roles'] as List)
                .map((e) => (e as String?).jsonUserRoles)
                .toList(),
          ),
    isEmailVerified: json["isEmailVerified"],
    avatar: json["avatar"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );
}
