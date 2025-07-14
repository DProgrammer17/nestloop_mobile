class GetChildDocsRequest {
  final String? id;

  GetChildDocsRequest({
    required this.id,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
