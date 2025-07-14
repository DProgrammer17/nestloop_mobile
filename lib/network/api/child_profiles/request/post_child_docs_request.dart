class PostChildDocsRequest {
  final String childProfileId;
  final List<String> documents;

  PostChildDocsRequest({
    required this.childProfileId,
    required this.documents,
  });

  Map<String, dynamic> toJson() => {
    "childProfileId": childProfileId,
    "documents": List<dynamic>.from(documents),
  };
}
