class ProfileSummary {
  final int status;
  final String message;
  final Data data;

  ProfileSummary({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileSummary.fromJson(Map<String, dynamic> json) {
    return ProfileSummary(
      status: json['status'] ?? 0, // Defaulting to 0 if null
      message: json['message'] ?? 'Unknown', // Defaulting to a fallback message
      data: Data.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class Data {
  final int id;
  final int userId;
  final String summary;
  final String createdAt;
  final String updatedAt;

  Data({
    required this.id,
    required this.userId,
    required this.summary,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] ?? 0, // Defaulting to 0 if null
      userId: json['user_id'] ?? 0, // Defaulting to 0 if null
      summary: json['summary'] ?? "", // Defaulting to an empty string if null
      createdAt: json['created_at'] ?? "", // Defaulting to an empty string if null
      updatedAt: json['updated_at'] ?? "", // Defaulting to an empty string if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'summary': summary,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
