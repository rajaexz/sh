import 'dart:convert';

JobDetailModel jobDetailModelFromJson(String str) => JobDetailModel.fromJson(json.decode(str));

String jobDetailModelToJson(JobDetailModel data) => json.encode(data.toJson());

class JobDetailModel {
  int? status;
  String? message;
  Data? data;

  JobDetailModel({
    this.status,
    this.message,
    this.data,
  });

  factory JobDetailModel.fromJson(Map<String, dynamic> json) => JobDetailModel(
    status: json["status"] ?? 0,
    message: json["message"] ?? "",
    data: json["data"] != null ? Data.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}
class Data {
  int? id;
  String? title;
  String? description;
  String? benefits;
  String? companyName;
  int? companyId; // Keep this as int? and parse it carefully
  String? companyLogo;
  String? country;
  String? state;
  String? city;
  int? isFreelance;
  String? careerLevel;
  int? salaryFrom;
  int? salaryTo;
  int? hideSalary;
  String? salaryCurrency;
  String? salaryPeriod;
  String? functionalArea;
  String? jobType;
  String? jobShift;
  int? numOfPositions;
  String? gender;
  DateTime? expiryDate;
  String? degreeLevel;
  String? jobExperience;
  int? isActive;
  int? isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? slug;
  String? interviewMode;
  dynamic reference;
  dynamic location;
  dynamic postalCode;
  dynamic jobAdvertiser;
  dynamic applicationUrl;
  dynamic jsonObject;
  int? isApply;
  int? isFav;
  String? address;
  List<String?>? skills;
  String? organizationCategory;
  String? englishLevelRequired;

  Data({
    this.id,
    this.title,
    this.description,
    this.benefits,
    this.companyName,
    this.companyId,
    this.companyLogo,
    this.country,
    this.state,
    this.city,
    this.isFreelance,
    this.careerLevel,
    this.salaryFrom,
    this.salaryTo,
    this.hideSalary,
    this.salaryCurrency,
    this.salaryPeriod,
    this.functionalArea,
    this.jobType,
    this.jobShift,
    this.numOfPositions,
    this.gender,
    this.expiryDate,
    this.degreeLevel,
    this.jobExperience,
    this.isActive,
    this.isFeatured,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.reference,
    this.location,
    this.postalCode,
    this.jobAdvertiser,
    this.applicationUrl,
    this.jsonObject,
    this.isApply,
    this.isFav,
    this.skills,
    this.address,
    this.interviewMode,
    this.organizationCategory,
    this.englishLevelRequired,
  });
  factory Data.fromJson(Map<String, dynamic> json) {


    int? _parseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is String) return int.tryParse(value);
      return null;
    }

    DateTime? _parseDate(dynamic value) {
      if (value == null) return null;
      if (value is DateTime) return value;
      if (value is String) return DateTime.tryParse(value);
      return null;
    }
   return Data(
      id: _parseInt(json['id']),
      title: json['title'] as String?,
      description: json['description'] as String?,
      benefits: json['benefits'] as String?,
      companyName: json['company_name'] as String?,
      companyId: _parseInt(json['company_id']),
      companyLogo: json['company_logo'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      isFreelance: _parseInt(json['is_freelance']),
      careerLevel: json['career_level'] as String?,
      salaryFrom: _parseInt(json['salary_from']),
      salaryTo: _parseInt(json['salary_to']),
      hideSalary: _parseInt(json['hide_salary']),
      salaryCurrency: json['salary_currency'] as String?,
      salaryPeriod: json['salary_period'] as String?,
      functionalArea: json['functional_area'] as String?,
      jobType: json['job_type'] as String?,
      jobShift: json['job_shift'] as String?,
      numOfPositions: _parseInt(json['num_of_positions']),
      gender: json['gender'] as String?,
      expiryDate: _parseDate(json['expiry_date']),
      degreeLevel: json['degree_level'] as String?,
      jobExperience: json['job_experience'] as String?,
      isActive: _parseInt(json['is_active']),
      isFeatured: _parseInt(json['is_featured']),
      createdAt: _parseDate(json['created_at']),
      updatedAt: _parseDate(json['updated_at']),
      slug: json['slug'] as String?,
      reference: json['reference'] as String?,
      location: json['location'] as String?,
      postalCode: json['postal_code'] as String?,
      jobAdvertiser: json['job_advertiser'] as String?,
      applicationUrl: json['application_url'] as String?,
      jsonObject: json['json_object'] as String?,
      address: json['address'] as String?,
      interviewMode: json['interview_mode'] as String?,
      organizationCategory: json['Organization_Category'] as String?,
      englishLevelRequired: json['english_level_required'] as String?,
      isApply: _parseInt(json['is_apply']),
      isFav: _parseInt(json['is_fav']),
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }


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
      "interview_mode": interviewMode,
      "Organization_Category": organizationCategory,
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
      "is_apply": isApply,
      "is_fav": isFav,
      "skills": skills,
      "address": address,
    };
  }



