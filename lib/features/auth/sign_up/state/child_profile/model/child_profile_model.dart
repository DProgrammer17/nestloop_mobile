import 'dart:io';

import 'package:nest_loop_mobile/core/utility_state/docs/doc_info_model.dart';

class ChildProfileModel {
  final File image;
  final String name;
  final String gender;
  final String dob;
  final String diagnosis;
  final int age;
  final String? allergies;
  final String? triggers;
  final String? therapyGoals;
  final String? dailyRoutine;
  final List<String> tags;
  final List<DocInfoModel> childDocs;

  const ChildProfileModel({
    required this.image,
    required this.name,
    required this.gender,
    required this.dob,
    required this.diagnosis,
    required this.age,
    this.allergies,
    this.triggers,
    this.therapyGoals,
    this.dailyRoutine,
    this.tags = const [],
    this.childDocs = const [],
  });
}
