

class FavoriteJobModel {
  int? status;
  String? message;
  List<Datum>? data;

  FavoriteJobModel({
    this.status,
    this.message,
    this.data,
  });

  factory FavoriteJobModel.fromJson(Map<String, dynamic> json) => FavoriteJobModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
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
 String?  careerLevel;
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
    this.numOfPositions,
     this.careerLevel
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
    numOfPositions: json["num_of_positions"],
        careerLevel: json["career_level"] ?? "" ,
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
    "num_of_positions":numOfPositions
  };
}
