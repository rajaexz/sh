
// To parse this JSON data, do
//
//     final jobListModel = jobListModelFromJson(jsonString);

import 'dart:convert';

JobListModel jobListModelFromJson(String str) => JobListModel.fromJson(json.decode(str));

String jobListModelToJson(JobListModel data) => json.encode(data.toJson());

class JobListModel {
  int? status;
  String? message;
  Data? data;

  JobListModel({
    this.status,
    this.message,
    this.data,
  });

  factory JobListModel.fromJson(Map<String, dynamic> json) => JobListModel(
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
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int? id;
  String? title;
  String? description;
  String? companyName;
  int? companyId;
  String? companyLogo;
  String? state;
  String? city;
  int? isFreelance;
  int? salaryFrom;
  int? salaryTo;
  int? hideSalary;
  String? jobType;
  String? jobExperience;
  DateTime? createdAt;
  int? isApply;
  int? isFav;
  int? numOfPositions;
   String? careerLevel;
    int? isFeatured;
  Datum({
    this.id,
    this.title,
    this.description,
    this.companyName,
    this.companyId,
    this.companyLogo,
    this.state,
    this.city,
    this.isFreelance,
    this.salaryFrom,
    this.salaryTo,
    this.hideSalary,
    this.jobType,
    this.jobExperience,
    this.createdAt,
    this.isApply,
    this.isFav,   
    this.careerLevel,
    this.numOfPositions,
    this.isFeatured,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    companyName: json["company_name"],
    companyId: json["company_id"],
    companyLogo: json["company_logo"],
    state: json["state"],
    city: json["city"],
    isFreelance: json["is_freelance"],
    salaryFrom: json["salary_from"],
    salaryTo: json["salary_to"],
    hideSalary: json["hide_salary"],
    jobType: json["job_type"],
    jobExperience: json["job_experience"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    isApply: json["is_apply"],
    isFav: json["is_fav"],
    careerLevel: json["career_level"] ?? "" ,
      isFeatured: json["is_featured"] ?? 0 ,
    numOfPositions:  json["num_of_positions"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "company_name": companyName,
    "company_id": companyId,
    "company_logo": companyLogo,
    "state": state,
    "city": city,
    "is_freelance": isFreelance,
    "salary_from": salaryFrom,
    "salary_to": salaryTo,
    "hide_salary": hideSalary,
    "job_type": jobType,
    "job_experience": jobExperience,
    "created_at": createdAt?.toIso8601String(),
    "is_apply": isApply,
    "is_fav": isFav,
    "num_of_positions":numOfPositions,
    "career_level":careerLevel
  };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
