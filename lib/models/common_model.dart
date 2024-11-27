import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonModel {
  int? id;
  String? title;
  String? subTitle;
  String? description;
  String? translatedName;
  String? image;
  IconData? iconData;
  List<CommonModel>? commonModel;
  dynamic value;
  Locale? locale;
  bool? isChecked;
  String? countryCode;
  bool? isNested;
  String? phone;
  String? currency;
  String? routes;
  Color? iconColor;
  dynamic contentType;
  bool? isVisible;
  String? redirectType;

  CommonModel(
      {this.id,
      this.title,
      this.description,
      this.translatedName,
      this.value,
      this.commonModel,
      this.image,
        this.contentType,
        this.redirectType,
      this.locale,
      this.countryCode,
        this.iconColor,
      this.phone,
        this.isNested,
      this.currency,
      this.iconData,
        this.isVisible,
        this.routes,
      this.isChecked});

  factory CommonModel.fromJson(dynamic json) => CommonModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      translatedName: json["translatedName"],
      value: json["value"],
      image: json["image"],
      redirectType: json['redirectType'],
      iconColor: json["iconColor"],
      locale: json["locale"],
      iconData: json["iconData"],
      isNested: json["isNested"],
      countryCode: json["countryCode"],
      phone: json["phone"],
      routes: json["routes"],
      isVisible: json["isVisible"],
      currency: json["currency"],
      commonModel: json["commonModel"] == null ? [] : List<CommonModel>.from(json["commonModel"]!.map((x) => CommonModel.fromJson(x))),
      isChecked: json["isChecked"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    map["translatedName"] = translatedName;
    map["value"] = value;
    map["locale"] = locale;
    map["countryCode"] = countryCode;
    map["phone"] = phone;
    map["currency"] = currency;
    map["routes"] = routes;
    map["isChecked"] = isChecked;
    map["isNested"] = isNested;
    map["isVisible"] = isVisible;
    return map;
  }
}
