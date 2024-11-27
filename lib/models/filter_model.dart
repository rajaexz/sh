

// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'dart:convert';

FilterModel filterModelFromJson(String str) => FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  int? status;
  String? message;
  List<FilterDatum>? data;

  FilterModel({
    this.status,
    this.message,
    this.data,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<FilterDatum>.from(json["data"]!.map((x) => FilterDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class FilterDatum {
  int? id;
  String? value;
  bool? isSelected;

  FilterDatum({
    this.id,
    this.value,
    this.isSelected,
  });

  factory FilterDatum.fromJson(Map<String, dynamic> json) => FilterDatum(
    id: json["id"],
    value: json["value"],
    isSelected: false
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
  };
}

