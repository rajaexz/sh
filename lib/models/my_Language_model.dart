
import 'dart:convert';

MyLanguageModel myLanguageModelFromJson(String str) => MyLanguageModel.fromJson(json.decode(str));

String myLanguageModelToJson(MyLanguageModel data) => json.encode(data.toJson());

class MyLanguageModel {
    int status;
    String message;
    List<Datum>?  data;

    MyLanguageModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory MyLanguageModel.fromJson(Map<String, dynamic> json) => MyLanguageModel(
        status: json["status"],
        message: json["message"],
          data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int userId;
    int languageId;
    String languageName;
    int languageLevelId;
    String languageLevelName;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.userId,
        required this.languageId,
        required this.languageName,
        required this.languageLevelId,
        required this.languageLevelName,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        languageId: json["language_id"],
        languageName: json["language_name"],
        languageLevelId: json["language_level_id"],
        languageLevelName: json["language_level_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "language_id": languageId,
        "language_name": languageName,
        "language_level_id": languageLevelId,
        "language_level_name": languageLevelName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
