class ChildDiagnosis {
  final String name;
  final String code;
  final String category;

  ChildDiagnosis({
    required this.name,
    required this.code,
    required this.category,
  });

  factory ChildDiagnosis.fromJson(Map<String, dynamic> json) {
    return ChildDiagnosis(
      name: json['name'],
      code: json['code'],
      category: json['category'],
    );
  }
}
