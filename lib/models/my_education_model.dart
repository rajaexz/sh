
// To parse this JSON data, do
//
//     final myEducationModel = myEducationModelFromJson(jsonString);

import 'dart:convert';

MyEducationModel myEducationModelFromJson(String str) => MyEducationModel.fromJson(json.decode(str));

String myEducationModelToJson(MyEducationModel data) => json.encode(data.toJson());

class MyEducationModel {
  int? status;
  String? message;
  List<Datum>? data;

  MyEducationModel({
    this.status,
    this.message,
    this.data,
  });

  factory MyEducationModel.fromJson(Map<String, dynamic> json) => MyEducationModel(
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
  int? degreeLevelId;
  String? degreeLevelName;
  int? degreeTypeId;
  String? degreeTypeName;
  String? degreeTitle;
  int? countryId;
  String? countryName;
  int? stateId;
  String? stateName;
  int? cityId;
  String? cityName;
  String? dateCompletion;
  String? institution;
  String? degreeResult;
  int? resultTypeId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.degreeLevelId,
    this.degreeLevelName,
    this.degreeTypeId,
    this.degreeTypeName,
    this.degreeTitle,
    this.countryId,
    this.countryName,
    this.stateId,
    this.stateName,
    this.cityId,
    this.cityName,
    this.dateCompletion,
    this.institution,
    this.degreeResult,
    this.resultTypeId,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    degreeLevelId: json["degree_level_id"],
    degreeLevelName: json["degree_level_name"],
    degreeTypeId: json["degree_type_id"],
    degreeTypeName: json["degree_type_name"],
    degreeTitle: json["degree_title"],
    countryId: json["country_id"],
    countryName: json["country_name"],
    stateId: json["state_id"],
    stateName: json["state_name"],
    cityId: json["city_id"],
    cityName: json["city_name"],
    dateCompletion: json["date_completion"],
    institution: json["institution"],
    degreeResult: json["degree_result"],
    resultTypeId: json["result_type_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "degree_level_id": degreeLevelId,
    "degree_level_name": degreeLevelName,
    "degree_type_id": degreeTypeId,
    "degree_type_name": degreeTypeName,
    "degree_title": degreeTitle,
    "country_id": countryId,
    "country_name": countryName,
    "state_id": stateId,
    "state_name": stateName,
    "city_id": cityId,
    "city_name": cityName,
    "date_completion": dateCompletion,
    "institution": institution,
    "degree_result": degreeResult,
    "result_type_id": resultTypeId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
