import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/create_child_profile_request.dart';
import 'package:nest_loop_mobile/network/net_utils/net_helper_utils.dart';

class UpdateChildProfileRequest {
  final String childId;
  final String name;
  final DateTime dateOfBirth;
  final String gender;
  final List<String> diagnoses;
  final List<String> allergies;
  final List<String> triggers;
  final List<String> therapyGoals;
  final List<RoutineInfo> dailyRoutine;
  final List<String> tags;

  UpdateChildProfileRequest({
    required this.childId,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.diagnoses,
    required this.allergies,
    required this.triggers,
    required this.therapyGoals,
    required this.dailyRoutine,
    required this.tags,
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
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };

  /// Method to create FormData for multipart requests
  FormData toFormData() {
    final formData = FormData();

    /// Add JSON data as fields
    final jsonData = toJson();
    jsonData.forEach((key, value) {
      final entries = switch (value) {
        List list => list.map(
              (item) => MapEntry(key, NetHelperUtils.formatValue(item)),
        ),
        _ => [MapEntry(key, value.toString())],
      };
      formData.fields.addAll(entries);
    });

    ///Add daily routine
    formData.fields.add(MapEntry('dailyRoutine', json.encode(dailyRoutine)));

    print(formData.fields);
    return formData;
  }
}
