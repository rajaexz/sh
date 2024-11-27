// To parse this JSON data, do
//
//     final schoolListModel = schoolListModelFromJson(jsonString);

import 'dart:convert';

SchoolListModel schoolListModelFromJson(String str) => SchoolListModel.fromJson(json.decode(str));

String schoolListModelToJson(SchoolListModel data) => json.encode(data.toJson());

class SchoolListModel {
  int? status;
  String? message;
  Data? data;

  SchoolListModel({
    this.status,
    this.message,
    this.data,
  });

  factory SchoolListModel.fromJson(Map<String, dynamic> json) => SchoolListModel(
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
  String? nextPageUrl;
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
  int? isFavouritesCompany;

  Datum({
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
    this.isFavouritesCompany,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    ceo: json["ceo"],
    industry: json["industry"],
    ownershipType: json["ownership_type"],
    description: json["description"],
    location: json["location"],
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
    isFeatured: json["is_featured"],
    verified: json["verified"],
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
    "is_favourites_company": isFavouritesCompany,
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
