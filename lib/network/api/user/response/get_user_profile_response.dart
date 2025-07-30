import 'package:nest_loop_mobile/network/api/carer/response/carer_invite_response.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/create_child_profile_request.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/care_permissions.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';

class GetUserProfileResponse {
  final int? status;
  final String? message;
  final HomeData? data;

  GetUserProfileResponse({this.status, this.message, this.data});

  factory GetUserProfileResponse.fromJson(Map<String, dynamic> json) =>
      GetUserProfileResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : HomeData.fromJson(json["data"]),
      );
}

class HomeData {
  final String? id;
  final String? fullName;
  final String? email;
  final String? postcode;
  final List<UserRoles>? roles;
  final Avatar? avatar;
  final bool? isEmailVerified;
  final List<ChildData>? children;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  HomeData({
    this.id,
    this.fullName,
    this.email,
    this.postcode,
    this.roles,
    this.avatar,
    this.isEmailVerified,
    this.children,
    this.createdAt,
    this.updatedAt,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    postcode: json["postcode"],
    roles: json["roles"] == null
        ? []
        : List<UserRoles>.from(
            (json['roles'] as List)
                .map((e) => (e as String?).jsonUserRoles)
                .toList(),
          ),
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
    isEmailVerified: json["isEmailVerified"],
    children: json["children"] == null
        ? []
        : List<ChildData>.from(
            (json["children"] as List<dynamic>).map(
              (x) => ChildData.fromJson(x),
            ),
          ),
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );
}

class Avatar {
  final String? url;
  final String? publicId;
  final String? extension;

  Avatar({this.url, this.publicId, this.extension});

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    url: json["url"],
    publicId: json["publicId"],
    extension: json["extension"],
  );
}

class ChildData {
  final String? id;
  final String? userId;
  final String? name;
  final DateTime? dateOfBirth;
  final String? gender;
  final int? age;
  final Avatar? avatar;
  final List<String>? diagnoses;
  final List<String>? allergies;
  final List<String>? triggers;
  final List<String>? therapyGoals;
  final List<RoutineInfo>? dailyRoutine;
  final String? medicalHistory;
  final List<String>? customTags;
  final List<Document>? documents;
  final List<PostCarerInviteResponse>? careTeam;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ChildData({
    this.id,
    this.userId,
    this.name,
    this.dateOfBirth,
    this.gender,
    this.age,
    this.avatar,
    this.therapyGoals,
    this.dailyRoutine,
    this.diagnoses,
    this.allergies,
    this.triggers,
    this.medicalHistory,
    this.customTags,
    this.documents,
    this.careTeam,
    this.createdAt,
    this.updatedAt,
  });

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
    id: json["_id"],
    userId: json["userId"],
    name: json["name"],
    dateOfBirth: json["dateOfBirth"] == null
        ? null
        : DateTime.parse(json["dateOfBirth"]),
    gender: json["gender"],
    age: json["age"],
    avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
    therapyGoals: json["therapyGoals"] == null
        ? []
        : List<String>.from(json["therapyGoals"]!),
    dailyRoutine: json["dailyRoutine"] == null
        ? []
        : List<RoutineInfo>.from(
      (json["dailyRoutine"] as List<dynamic>).map(
            (x) => RoutineInfo.fromJson(x),
      ),
    ),
    diagnoses: json["diagnoses"] == null
        ? []
        : List<String>.from(json["diagnoses"]!),
    allergies: json["allergies"] == null
        ? []
        : List<String>.from(json["allergies"]!),
    triggers: json["triggers"] == null
        ? []
        : List<String>.from(json["triggers"]!),
    medicalHistory: json["medicalHistory"],
    customTags: json["customTags"] == null
        ? []
        : List<String>.from(json["customTags"]!),
    documents: json["documents"] == null
        ? []
        : List<Document>.from(
            (json["documents"] as List<dynamic>).map(
              (x) => Document.fromJson(x),
            ),
          ),

    careTeam: json["careTeam"] == null
        ? []
        : List<PostCarerInviteResponse>.from(
            (json["careTeam"] as List<dynamic>).map(
              (x) => PostCarerInviteResponse.fromJson(x),
            ),
          ),
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );
}

class Document {
  final String? id;
  final String? name;
  final String? url;
  final String? fileType;
  final DateTime? uploadedAt;
  final String? publicId;
  final String? extension;

  Document({
    this.id,
    this.name,
    this.url,
    this.fileType,
    this.uploadedAt,
    this.publicId,
    this.extension,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    id: json["_id"],
    name: json["name"],
    url: json["url"],
    fileType: json["fileType"],
    uploadedAt: json["uploadedAt"] == null
        ? null
        : DateTime.parse(json["uploadedAt"]),
    publicId: json["publicId"],
    extension: json["extension"],
  );
}
