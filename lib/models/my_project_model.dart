// To parse this JSON data, do
//
//     final myProjectModel = myProjectModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyProjectModel myProjectModelFromJson(String str) => MyProjectModel.fromJson(json.decode(str));

String myProjectModelToJson(MyProjectModel data) => json.encode(data.toJson());

class MyProjectModel {
    int status;
    String message;
    List<Datum> data;

    MyProjectModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory MyProjectModel.fromJson(Map<String, dynamic> json) => MyProjectModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int userId;
    String name;
  
    String description;
    String url;
    DateTime dateStart;
    DateTime dateEnd;
    int isOnGoing;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.userId,
        required this.name,

        required this.description,
        required this.url,
        required this.dateStart,
        required this.dateEnd,
        required this.isOnGoing,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
   
        description: json["description"],
        url: json["url"] ?? "",
        dateStart: DateTime.parse(json["date_start"]),
        dateEnd: DateTime.parse(json["date_end"]),
        isOnGoing: json["is_on_going"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
      
        "description": description,
        "url": url,
        "date_start": dateStart.toIso8601String(),
        "date_end": dateEnd.toIso8601String(),
        "is_on_going": isOnGoing,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
