import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';

class GoogleSignUpRequest {
  final String idToken;
  final UserRoles role;

  GoogleSignUpRequest({
    required this.idToken,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
    "idToken": idToken,
    "role": role.jsonString,
  };
}
