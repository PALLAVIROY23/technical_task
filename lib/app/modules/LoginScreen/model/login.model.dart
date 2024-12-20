// To parse this JSON data, do
//
//     final loginApi = loginApiFromJson(jsonString);

import 'dart:convert';

LoginApi loginApiFromJson(String str) => LoginApi.fromJson(json.decode(str));

String loginApiToJson(LoginApi data) => json.encode(data.toJson());

class LoginApi {
  bool? status;
  String? message;
  String? token;
  Data? data;

  LoginApi({
    this.status,
    this.message,
    this.token,
    this.data,
  });

  factory LoginApi.fromJson(Map<String, dynamic> json) => LoginApi(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? profession;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.profession,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    profession: json["profession"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "profession": profession,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
