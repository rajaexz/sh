// To parse this JSON data, do
//
//     final applyJobModel = applyJobModelFromJson(jsonString);

import 'dart:convert';

ApplyJobModel applyJobModelFromJson(String str) => ApplyJobModel.fromJson(json.decode(str));

String applyJobModelToJson(ApplyJobModel data) => json.encode(data.toJson());

class ApplyJobModel {
  int? status;
  String? message;
  List<Datum>? data;

  ApplyJobModel({
    this.status,
    this.message,
    this.data,
  });

  factory ApplyJobModel.fromJson(Map<String, dynamic> json) => ApplyJobModel(
    status: json["status"],
    message: json["message"] ?? "",
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message ?? "",
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String title;
  String description;
  String benefits;
  String companyName;
  int? companyId;
  String companyLogo;
  String country;
  String state;
  String city;
  int? isFreelance;
  String careerLevel;
  int? salaryFrom;
  int? salaryTo;
  int? hideSalary;
  String salaryCurrency;
  String salaryPeriod;
  String functionalArea;
  String jobType;
  String jobShift;
  int? numOfPositions;
  String gender;
  DateTime? expiryDate;
  String degreeLevel;
  String jobExperience;
  int? isActive;
  int? isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;
  String slug;
  dynamic reference;
  dynamic location;
  dynamic postalCode;
  dynamic jobAdvertiser;
  dynamic applicationUrl;
  dynamic jsonObject;

  Datum({
    this.id,
    this.title = "",
    this.description = "",
    this.benefits = "",
    this.companyName = "",
    this.companyId,
    this.companyLogo = "",
    this.country = "",
    this.state = "",
    this.city = "",
    this.isFreelance,
    this.careerLevel = "",
    this.salaryFrom,
    this.salaryTo,
    this.hideSalary,
    this.salaryCurrency = "",
    this.salaryPeriod = "",
    this.functionalArea = "",
    this.jobType = "",
    this.jobShift = "",
    this.numOfPositions,
    this.gender = "",
    this.expiryDate,
    this.degreeLevel = "",
    this.jobExperience = "",
    this.isActive,
    this.isFeatured,
    this.createdAt,
    this.updatedAt,
    this.slug = "",
    this.reference,
    this.location,
    this.postalCode,
    this.jobAdvertiser,
    this.applicationUrl,
    this.jsonObject,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    benefits: json["benefits"] ?? "",
    companyName: json["company_name"] ?? "",
    companyId: json["company_id"],
    companyLogo: json["company_logo"] ?? "",
    country: json["country"] ?? "",
    state: json["state"] ?? "",
    city: json["city"] ?? "",
    isFreelance: json["is_freelance"],
    careerLevel: json["career_level"] ?? "",
    salaryFrom: json["salary_from"],
    salaryTo: json["salary_to"],
    hideSalary: json["hide_salary"],
    salaryCurrency: json["salary_currency"] ?? "",
    salaryPeriod: json["salary_period"] ?? "",
    functionalArea: json["functional_area"] ?? "",
    jobType: json["job_type"] ?? "",
    jobShift: json["job_shift"] ?? "",
    numOfPositions: json["num_of_positions"] ?? 0,
    gender: json["gender"] ?? "",
    expiryDate: json["expiry_date"] == null ? null : DateTime.parse(json["expiry_date"]),
    degreeLevel: json["degree_level"] ?? "",
    jobExperience: json["job_experience"] ?? "",
    isActive: json["is_active"],
    isFeatured: json["is_featured"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    slug: json["slug"] ?? "",
    reference: json["reference"],
    location: json["location"],
    postalCode: json["postal_code"],
    jobAdvertiser: json["job_advertiser"],
    applicationUrl: json["application_url"],
    jsonObject: json["json_object"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "benefits": benefits,
    "company_name": companyName,
    "company_id": companyId,
    "company_logo": companyLogo,
    "country": country,
    "state": state,
    "city": city,
    "is_freelance": isFreelance,
    "career_level": careerLevel,
    "salary_from": salaryFrom,
    "salary_to": salaryTo,
    "hide_salary": hideSalary,
    "salary_currency": salaryCurrency,
    "salary_period": salaryPeriod,
    "functional_area": functionalArea,
    "job_type": jobType,
    "job_shift": jobShift,
    "num_of_positions": numOfPositions,
    "gender": gender,
    "expiry_date": expiryDate?.toIso8601String(),
    "degree_level": degreeLevel,
    "job_experience": jobExperience,
    "is_active": isActive,
    "is_featured": isFeatured,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "slug": slug,
    "reference": reference,
    "location": location,
    "postal_code": postalCode,
    "job_advertiser": jobAdvertiser,
    "application_url": applicationUrl,
    "json_object": jsonObject,
  };
}
