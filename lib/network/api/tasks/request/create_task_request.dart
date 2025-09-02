import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';

class CreateTaskRequest {
  final List<TaskCategories> categories;
  final DateTime dateTime;
  final bool recurring;
  final String careProviderId;
  final bool sendNotifications;
  final String title;
  final String description;
  final String location;

  CreateTaskRequest({
    required this.categories,
    required this.dateTime,
    required this.recurring,
    required this.careProviderId,
    required this.sendNotifications,
    required this.title,
    required this.description,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
    "categories": List<String>.from(categories.map((x) => x.jsonString)),
    "dateTime": dateTime.toIso8601String(),
    "recurring": recurring,
    "careProviderId": careProviderId,
    "sendNotifications": sendNotifications,
    "title": title,
    "description": description,
    "location": location,
  };
}
