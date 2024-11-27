// To parse this JSON data, do
//
//     final profileDetailModel = profileDetailModelFromJson(jsonString);

import 'dart:convert';

ProfileDetailModel profileDetailModelFromJson(String str) => ProfileDetailModel.fromJson(json.decode(str));

String profileDetailModelToJson(ProfileDetailModel data) => json.encode(data.toJson());

class ProfileDetailModel {
  int? status;
  String? message;
  Data? data;

  ProfileDetailModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProfileDetailModel.fromJson(Map<String, dynamic> json) => ProfileDetailModel(
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
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? name;
  String? email;
  String? fatherName;
  DateTime? dateOfBirth;
  int? genderId;
  int? maritalStatusId;
  int? nationalityId;
  String? nationalIdCardNumber;
  String? countryId;
  String? stateId;
  String? cityId;
  String? phone;
  String? mobileNum;
  int? jobExperienceId;
  int? careerLevelId;
  int? industryId;
  int? functionalAreaId;
  String? currentSalary;
  String? expectedSalary;
  String? salaryCurrency;
  String? streetAddress;
  int? isActive;
  int? verified;
  dynamic verificationToken;
  dynamic provider;
  dynamic providerId;
  String? password;
  dynamic rememberToken;
  String? image;
  dynamic coverImage;
  dynamic lang;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isImmediateAvailable;
  int? numProfileViews;
  int? packageId;
  dynamic packageStartDate;
  dynamic packageEndDate;
  int? jobsQuota;
  int? availedJobsQuota;
  String? search;
  int? isSubscribed;
  dynamic videoLink;
  dynamic emailVerifiedAt;
  dynamic otp;
  dynamic otpTime;

  String? cityName;
  String? stateName;
  String? countryName;
  String? genderName;
  String? maritalStatusName;
  String? jobExperienceName;
  String? careerLevelName;
  String? industryName;
  String? functionalAreaName;

  Data({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.name,
    this.email,
    this.fatherName,
    this.dateOfBirth,
    this.genderId,
    this.maritalStatusId,
    this.nationalityId,
    this.nationalIdCardNumber,
    this.countryId,
    this.stateId,
    this.cityId,
    this.phone,
    this.mobileNum,
    this.jobExperienceId,
    this.careerLevelId,
    this.industryId,
    this.functionalAreaId,
    this.currentSalary,
    this.expectedSalary,
    this.salaryCurrency,
    this.streetAddress,
    this.isActive,
    this.verified,
    this.verificationToken,
    this.provider,
    this.providerId,
    this.password,
    this.rememberToken,
    this.image,
    this.coverImage,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.isImmediateAvailable,
    this.numProfileViews,
    this.packageId,
    this.packageStartDate,
    this.packageEndDate,
    this.jobsQuota,
    this.availedJobsQuota,
    this.search,
    this.isSubscribed,
    this.videoLink,
    this.emailVerifiedAt,
    this.otp,
    this.otpTime,
    this.cityName,
    this.stateName,
    this.countryName,
    this.genderName,
    this.maritalStatusName,
    this.jobExperienceName,
    this.careerLevelName,
    this.industryName,
    this.functionalAreaName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    middleName: json["middle_name"] ,
    lastName: json["last_name"],
    name: json["name"],
    email: json["email"],
    fatherName: json["father_name"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    genderId: json["gender_id"],
    maritalStatusId: json["marital_status_id"],
    nationalityId: json["nationality_id"],
    nationalIdCardNumber: json["national_id_card_number"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    phone: json["phone"],
    mobileNum: json["mobile_num"],
    jobExperienceId: json["job_experience_id"],
    careerLevelId: json["career_level_id"],
    industryId: json["industry_id"],
    functionalAreaId: json["functional_area_id"],
    currentSalary: json["current_salary"],
    expectedSalary: json["expected_salary"],
    salaryCurrency: json["salary_currency"],
    streetAddress: json["street_address"],
    isActive: json["is_active"],
    verified: json["verified"],
    verificationToken: json["verification_token"],
    provider: json["provider"],
    providerId: json["provider_id"],
    password: json["password"],
    rememberToken: json["remember_token"],
    image: json["image"],
    coverImage: json["cover_image"],
    lang: json["lang"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isImmediateAvailable: json["is_immediate_available"],
    numProfileViews: json["num_profile_views"],
    packageId: json["package_id"],
    packageStartDate: json["package_start_date"],
    packageEndDate: json["package_end_date"],
    jobsQuota: json["jobs_quota"],
    availedJobsQuota: json["availed_jobs_quota"],
    search: json["search"],
    isSubscribed: json["is_subscribed"],
    videoLink: json["video_link"],
    emailVerifiedAt: json["email_verified_at"],
    otp: json["otp"],
    otpTime: json["otp_time"],
    cityName: json["city_name"],
    stateName: json["state_name"] ,
    countryName: json["country_name"] ?? "",
    genderName: json["gender_name"] ?? "",
    maritalStatusName: json["marital_status_name"] ?? "",
    jobExperienceName: json["job_experience_name"] ,
    careerLevelName: json["career_level_name"] ,
    industryName: json["industry_name"] ?? "",
    functionalAreaName: json["functional_area_name"] ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "name": name,
    "email": email,
    "father_name": fatherName,
    "date_of_birth": dateOfBirth?.toIso8601String(),
    "gender_id": genderId,
    "marital_status_id": maritalStatusId,
    "nationality_id": nationalityId,
    "national_id_card_number": nationalIdCardNumber,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "phone": phone,
    "mobile_num": mobileNum,
    "job_experience_id": jobExperienceId,
    "career_level_id": careerLevelId,
    "industry_id": industryId,
    "functional_area_id": functionalAreaId,
    "current_salary": currentSalary,
    "expected_salary": expectedSalary,
    "salary_currency": salaryCurrency,
    "street_address": streetAddress,
    "is_active": isActive,
    "verified": verified,
    "verification_token": verificationToken,
    "provider": provider,
    "provider_id": providerId,
    "password": password,
    "remember_token": rememberToken,
    "image": image,
    "cover_image": coverImage,
    "lang": lang,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "is_immediate_available": isImmediateAvailable,
    "num_profile_views": numProfileViews,
    "package_id": packageId,
    "package_start_date": packageStartDate,
    "package_end_date": packageEndDate,
    "jobs_quota": jobsQuota,
    "availed_jobs_quota": availedJobsQuota,
    "search": search,
    "is_subscribed": isSubscribed,
    "video_link": videoLink,
    "email_verified_at": emailVerifiedAt,
    "otp": otp,
    "otp_time": otpTime,
    "city_name": cityName,
    "state_name": stateName,
    "country_name": countryName,
    "gender_name": genderName,
    "marital_status_name": maritalStatusName,
    "job_experience_name": jobExperienceName,
    "career_level_name": careerLevelName,
    "industry_name": industryName,
    "functional_area_name": functionalAreaName,
  };
}
