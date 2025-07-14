class DeleteChildProfileRequest {
  final String id;

  DeleteChildProfileRequest({
    required this.id,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
