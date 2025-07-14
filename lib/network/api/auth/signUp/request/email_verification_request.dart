class EmailVerificationRequest {
  final String email;

  EmailVerificationRequest({
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
