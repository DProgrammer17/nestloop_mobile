class SignUpResponse {
  final String? message;
  final String? userId;

  SignUpResponse({
    this.message,
    this.userId,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    message: json["message"],
    userId: json["userId"],
  );
}
