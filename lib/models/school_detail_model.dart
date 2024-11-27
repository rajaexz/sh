// To parse this JSON data, do
//
//     final schoolDetailModel = schoolDetailModelFromJson(jsonString);

import 'dart:convert';

SchoolDetailModel schoolDetailModelFromJson(String str) => SchoolDetailModel.fromJson(json.decode(str));

String schoolDetailModelToJson(SchoolDetailModel data) => json.encode(data.toJson());

class SchoolDetailModel {
  int? status;
  String? message;
  Data? data;

  SchoolDetailModel({
    this.status,
    this.message,
    this.data,
  });

  factory SchoolDetailModel.fromJson(Map<String, dynamic> json) => SchoolDetailModel(
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
  String? name;
  String? email;
  String? ceo;
  String? industry;
  String? ownershipType;
  String? description;
  String? location;
  int? noOfOffices;
  String? website;
  String? noOfEmployees;
  String? establishedIn;
  String? fax;
  String? phone;
  String? logo;
  String? country;
  String? state;
  String? city;
  String? slug;
  int? isActive;
  int? isFeatured;
  int? verified;
  dynamic verificationToken;
  String? password;
  String? rememberToken;
  String? map;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? googlePlus;
  String? pinterest;
  int? packageId;
  DateTime? packageStartDate;
  DateTime? packageEndDate;
  int? jobsQuota;
  int? availedJobsQuota;
  int? isSubscribed;
  dynamic cvsPackageId;
  dynamic cvsPackageStartDate;
  dynamic cvsPackageEndDate;
  dynamic cvsQuota;
  dynamic availedCvsQuota;
  dynamic availedCvsIds;
  dynamic emailVerifiedAt;
  String? paymentMethod;
  dynamic type;
  dynamic count;
  int? isFavouritesCompany;

  Data({
    this.id,
    this.name,
    this.email,
    this.ceo,
    this.industry,
    this.ownershipType,
    this.description,
    this.location,
    this.noOfOffices,
    this.website,
    this.noOfEmployees,
    this.establishedIn,
    this.fax,
    this.phone,
    this.logo,
    this.country,
    this.state,
    this.city,
    this.slug,
    this.isActive,
    this.isFeatured,
    this.verified,
    this.verificationToken,
    this.password,
    this.rememberToken,
    this.map,
    this.createdAt,
    this.updatedAt,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.googlePlus,
    this.pinterest,
    this.packageId,
    this.packageStartDate,
    this.packageEndDate,
    this.jobsQuota,
    this.availedJobsQuota,
    this.isSubscribed,
    this.cvsPackageId,
    this.cvsPackageStartDate,
    this.cvsPackageEndDate,
    this.cvsQuota,
    this.availedCvsQuota,
    this.availedCvsIds,
    this.emailVerifiedAt,
    this.paymentMethod,
    this.type,
    this.count,
    this.isFavouritesCompany,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    ceo: json["ceo"],
    industry: json["industry"],
    ownershipType: json["ownership_type"],
    description: json["description"],
    location: json["location"] as String?,
    noOfOffices: json["no_of_offices"],
    website: json["website"],
    noOfEmployees: json["no_of_employees"],
    establishedIn: json["established_in"],
    fax: json["fax"],
    phone: json["phone"],
    logo: json["logo"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    slug: json["slug"],
    isActive: json["is_active"],
    isFeatured: json["is_featured"] ?? 0,
    verified: json["verified"],
    verificationToken: json["verification_token"],
    password: json["password"],
    rememberToken: json["remember_token"],
    map: json["map"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    facebook: json["facebook"] ?? "",
    twitter: json["twitter"] ?? "",
    linkedin: json["linkedin"]?? "",
    googlePlus: json["google_plus"]?? "",
    pinterest: json["pinterest"]?? "",
    packageId: json["package_id"],
    packageStartDate: json["package_start_date"] == null ? null : DateTime.parse(json["package_start_date"]),
    packageEndDate: json["package_end_date"] == null ? null : DateTime.parse(json["package_end_date"]),
    jobsQuota: json["jobs_quota"],
    availedJobsQuota: json["availed_jobs_quota"],
    isSubscribed: json["is_subscribed"],
    cvsPackageId: json["cvs_package_id"],
    cvsPackageStartDate: json["cvs_package_start_date"],
    cvsPackageEndDate: json["cvs_package_end_date"],
    cvsQuota: json["cvs_quota"],
    availedCvsQuota: json["availed_cvs_quota"],
    availedCvsIds: json["availed_cvs_ids"],
    emailVerifiedAt: json["email_verified_at"],
    paymentMethod: json["payment_method"],
    type: json["type"],
    count: json["count"],
    isFavouritesCompany: json["is_favourites_company"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "ceo": ceo,
    "industry": industry,
    "ownership_type": ownershipType,
    "description": description,
    "location": location,
    "no_of_offices": noOfOffices,
    "website": website,
    "no_of_employees": noOfEmployees,
    "established_in": establishedIn,
    "fax": fax,
    "phone": phone,
    "logo": logo,
    "country": country,
    "state": state,
    "city": city,
    "slug": slug,
    "is_active": isActive,
    "is_featured": isFeatured,
    "verified": verified,
    "verification_token": verificationToken,
    "password": password,
    "remember_token": rememberToken,
    "map": map,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "facebook": facebook,
    "twitter": twitter,
    "linkedin": linkedin,
    "google_plus": googlePlus,
    "pinterest": pinterest,
    "package_id": packageId,
    "package_start_date": packageStartDate?.toIso8601String(),
    "package_end_date": packageEndDate?.toIso8601String(),
    "jobs_quota": jobsQuota,
    "availed_jobs_quota": availedJobsQuota,
    "is_subscribed": isSubscribed,
    "cvs_package_id": cvsPackageId,
    "cvs_package_start_date": cvsPackageStartDate,
    "cvs_package_end_date": cvsPackageEndDate,
    "cvs_quota": cvsQuota,
    "availed_cvs_quota": availedCvsQuota,
    "availed_cvs_ids": availedCvsIds,
    "email_verified_at": emailVerifiedAt,
    "payment_method": paymentMethod,
    "type": type,
    "count": count,
    "is_favourites_company": isFavouritesCompany,
  };
}
