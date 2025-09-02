import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';

class UpdateTaskRequest {
  final String id;
  final List<TaskCategories> categories;
  final DateTime dateTime;
  final bool recurring;
  final bool sendNotifications;
  final String title;
  final String description;
  final String location;

  UpdateTaskRequest({
    required this.id,
    required this.categories,
    required this.dateTime,
    required this.recurring,
    required this.sendNotifications,
    required this.title,
    required this.description,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": List<String>.from(categories.map((x) => x.jsonString)),
    "dateTime": dateTime.toIso8601String(),
    "recurring": recurring,
    "sendNotifications": sendNotifications,
    "title": title,
    "description": description,
    "location": location,
  };
}
