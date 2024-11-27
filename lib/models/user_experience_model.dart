// To parse this JSON data, do
//
//     final userExperienceModel = userExperienceModelFromJson(jsonString);

import 'dart:convert';

UserExperienceModel userExperienceModelFromJson(String str) => UserExperienceModel.fromJson(json.decode(str));

String userExperienceModelToJson(UserExperienceModel data) => json.encode(data.toJson());

class UserExperienceModel {
  int? status;
  String? message;
  List<Datum>? data;

  UserExperienceModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserExperienceModel.fromJson(Map<String, dynamic> json) => UserExperienceModel(
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
  String? title;
  String? company;
  int? countryId;
  int? stateId;
  int? cityId;
  DateTime? dateStart;
  DateTime? dateEnd;
  int? isCurrentlyWorking;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? countryName;
  String? stateName;
  String? cityName;

  Datum({
    this.id,
    this.userId,
    this.title,
    this.company,
    this.countryId,
    this.stateId,
    this.cityId,
    this.dateStart,
    this.dateEnd,
    this.isCurrentlyWorking,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.countryName,
    this.stateName,
    this.cityName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    company: json["company"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    dateStart: json["date_start"] == null ? null : DateTime.parse(json["date_start"]),
    dateEnd: json["date_end"] == null ? null : DateTime.parse(json["date_end"]),
    isCurrentlyWorking: json["is_currently_working"],
    description: json["description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    countryName: json["country_name"],
    stateName: json["state_name"],
    cityName: json["city_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "company": company,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "date_start": dateStart?.toIso8601String(),
    "date_end": dateEnd?.toIso8601String(),
    "is_currently_working": isCurrentlyWorking,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "country_name": countryName,
    "state_name": stateName,
    "city_name": cityName,
  };
}
