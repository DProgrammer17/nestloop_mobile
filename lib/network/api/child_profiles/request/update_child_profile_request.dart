class UpdateChildProfileRequest {
  final String childId;
  final String name;
  final DateTime dateOfBirth;
  final String gender;
  final List<String> diagnoses;
  final List<String> allergies;
  final List<String> triggers;
  final List<String> therapyGoals;
  final List<String> dailyRoutine;
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
    "childId": childId,
    "name": name,
    "dateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "diagnoses": List<dynamic>.from(diagnoses.map((x) => x)),
    "allergies": List<dynamic>.from(allergies.map((x) => x)),
    "triggers": List<dynamic>.from(triggers.map((x) => x)),
    "therapyGoals": List<dynamic>.from(therapyGoals.map((x) => x)),
    "dailyRoutine": List<dynamic>.from(dailyRoutine.map((x) => x)),
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };
}
