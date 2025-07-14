import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';

class AppleAuthRequest {
  final String identityToken;
  final String authorizationCode;
  final UserRoles role;
  final User? user;

  AppleAuthRequest({
    required this.identityToken,
    required this.authorizationCode,
    required this.role,
    this.user,
  });

  Map<String, dynamic> toJson() => {
    "identityToken": identityToken,
    "authorizationCode": authorizationCode,
    "role": role.jsonString,
    "user": user?.toJson(),
  };
}

class User {
  User();

  Map<String, dynamic> toJson() => {
  };
}
