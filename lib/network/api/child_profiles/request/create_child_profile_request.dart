import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class CreateChildProfileRequest {
  final String name;
  final DateTime dateOfBirth;
  final String gender;
  final List<String> diagnoses;
  final List<String> allergies;
  final List<String> triggers;
  final List<String> therapyGoals;
  final List<String> dailyRoutine;
  final List<String> tags;
  final List<MultipartFile> documents;
  final MultipartFile avatar;

  CreateChildProfileRequest({
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.diagnoses,
    required this.allergies,
    required this.triggers,
    required this.therapyGoals,
    required this.dailyRoutine,
    required this.tags,
    required this.documents,
    required this.avatar,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "dateOfBirth":
        "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "diagnoses": List<dynamic>.from(diagnoses.map((x) => x)),
    "allergies": List<dynamic>.from(allergies.map((x) => x)),
    "triggers": List<dynamic>.from(triggers.map((x) => x)),
    "therapyGoals": List<dynamic>.from(therapyGoals.map((x) => x)),
    "dailyRoutine": List<dynamic>.from(dailyRoutine.map((x) => x)),
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };

  /// Method to create FormData for multipart requests
  FormData toFormData() {
    final formData = FormData();

    /// Add JSON data as fields
    final jsonData = toJson();
    jsonData.forEach((key, value) {
      if (value is List) {
        for (var item in value) {
          formData.fields.add(MapEntry(key, item.toString()));
        }
      } else {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    });

    /// Add the file if it exists
    formData.files.add(MapEntry('avatar', avatar));

    /// Add document files
    for (int i = 0; i < documents.length; i++) {
      formData.files.add(MapEntry('documents', documents[i]));
    }

    print(formData.fields);
    return formData;
  }

}
