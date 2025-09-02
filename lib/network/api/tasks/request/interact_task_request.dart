class InteractTaskRequest {
  final String id;

  InteractTaskRequest({
    required this.id,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
