// To parse this JSON data, do
//
//     final jobSkillModel = jobSkillModelFromJson(jsonString);

import 'dart:convert';

JobSkillModel jobSkillModelFromJson(String str) => JobSkillModel.fromJson(json.decode(str));

String jobSkillModelToJson(JobSkillModel data) => json.encode(data.toJson());

class JobSkillModel {
  int? status;
  String? message;
  List<Datum>? data;

  JobSkillModel({
    this.status,
    this.message,
    this.data,
  });

  factory JobSkillModel.fromJson(Map<String, dynamic> json) => JobSkillModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? userId;
  int? jobSkillId;
  int? jobExperienceId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? jobSkillName;
  String? asJobExperienceName;

  Datum({
    this.id,
    this.userId,
    this.jobSkillId,
    this.jobExperienceId,
    this.createdAt,
    this.updatedAt,
    this.jobSkillName,
    this.asJobExperienceName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    jobSkillId: json["job_skill_id"],
    jobExperienceId: json["job_experience_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    jobSkillName: json["job_skill_name"],
    asJobExperienceName: json["job_experience_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "job_skill_id": jobSkillId,
    "job_experience_id": jobExperienceId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "job_skill_name": jobSkillName,
    "job_experience_name": asJobExperienceName,
  };
}
