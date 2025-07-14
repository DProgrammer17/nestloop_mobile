class GetCarerQuery {
  final String? fullName;
  final String? email;

  GetCarerQuery({
    this.fullName,
    this.email,
  });

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
  };
}
