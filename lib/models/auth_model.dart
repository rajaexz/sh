
// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  int? status;
  String? message;
  Data? data;

  AuthModel({
    this.status,
    this.message,
    this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? user;
  int? otp;

  Data({
    this.user,
    this.otp,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "otp": otp,
  };
}


///////////////////
///
///

class AuthModel2 {
  int? status;
  String? message;
  Data2? data;

  AuthModel2({
    this.status,
    this.message,
    this.data,
  });

  factory AuthModel2.fromJson(Map<String, dynamic> json) => AuthModel2(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data2.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data2 {
  int? id;
  int? otp;

  Data2({
    this.id,
    this.otp,
  });

  factory Data2.fromJson(Map<String, dynamic> json) => Data2(
    id: json["id"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "otp": otp,
  };
}
