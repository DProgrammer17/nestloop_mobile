import 'package:nest_loop_mobile/network/api/carer/response/care_provider_response.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/response/get_child_care_provider_response.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_statuses.dart';

class GetTasksResponse {
  final String? id;
  final ParentInfo? parent;
  final CareProviderResponse? careProvider;
  final List<TaskCategories>? categories;
  final DateTime? dateTime;
  final bool? recurring;
  final bool? sendNotifications;
  final String? title;
  final String? description;
  final String? location;
  final TaskStatus? status;
  final DateTime? completedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GetTasksResponse({
    this.id,
    this.parent,
    this.careProvider,
    this.categories,
    this.dateTime,
    this.recurring,
    this.sendNotifications,
    this.title,
    this.description,
    this.location,
    this.status,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory GetTasksResponse.fromJson(Map<String, dynamic> json) => GetTasksResponse(
    id: json["_id"],
    parent: json["parent"] == null ? null : ParentInfo.fromJson(json["parent"]),
    careProvider: json["careProvider"] == null ? null : CareProviderResponse.fromJson(json["careProvider"]),
    categories: json["categories"] == null
        ? []
        : List<TaskCategories>.from(
      (json['categories'] as List)
          .map((e) => (e as String?).jsonTaskCategories)
          .toList(),
    ),
    dateTime: json["dateTime"] == null ? null : DateTime.tryParse(json["dateTime"]),
    recurring: json["recurring"],
    sendNotifications: json["sendNotifications"],
    title: json["title"],
    description: json["description"],
    location: json["location"],
    status: (json["status"] as String?).jsonTaskStatus,
    completedAt: json["completedAt"] == null ? null : DateTime.tryParse(json["completedAt"]),
    createdAt: json["createdAt"] == null ? null : DateTime.tryParse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.tryParse(json["updatedAt"]),
  );
}
