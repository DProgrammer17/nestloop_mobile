import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';

class SignUpRequest {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final List<UserRoles> roles;

  SignUpRequest({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.roles,
  });

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
    "roles": List<dynamic>.from(roles.map((x) => x.jsonString)),
  };
}
