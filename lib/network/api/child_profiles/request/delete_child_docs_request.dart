class DeleteChildDocsRequest {
  final String id;
  final List<String> docIds;

  DeleteChildDocsRequest({
    required this.id,
    required this.docIds,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "docIds": List<String>.from(docIds),
  };
}
