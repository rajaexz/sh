// To parse this JSON data, do
//
//     final cvListModel = cvListModelFromJson(jsonString);

import 'dart:convert';

CvListModel cvListModelFromJson(String str) => CvListModel.fromJson(json.decode(str));

String cvListModelToJson(CvListModel data) => json.encode(data.toJson());

class CvListModel {
  int? status;
  String? message;
  List<Datum>? data;

  CvListModel({
    this.status,
    this.message,
    this.data,
  });

  factory CvListModel.fromJson(Map<String, dynamic> json) => CvListModel(
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
  String? cvFile;
  int? isDefault;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.title,
    this.cvFile,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    cvFile: json["cv_file"],
    isDefault: json["is_default"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "cv_file": cvFile,
    "is_default": isDefault,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
