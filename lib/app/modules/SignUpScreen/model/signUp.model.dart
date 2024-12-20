// To parse this JSON data, do
//
//     final signUpApi = signUpApiFromJson(jsonString);

import 'dart:convert';

SignUpApi signUpApiFromJson(String str) => SignUpApi.fromJson(json.decode(str));

String signUpApiToJson(SignUpApi data) => json.encode(data.toJson());

class SignUpApi {
  User? user;
  String? message;

  SignUpApi({
    this.user,
    this.message,
  });

  factory SignUpApi.fromJson(Map<String, dynamic> json) => SignUpApi(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "message": message,
  };
}

class User {
  String? name;
  String? email;
  String? phone;
  String? profession;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  User({
    this.name,
    this.email,
    this.phone,
    this.profession,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    profession: json["profession"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "profession": profession,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
