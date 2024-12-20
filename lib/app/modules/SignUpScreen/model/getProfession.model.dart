// To parse this JSON data, do
//
//     final getProfessionApi = getProfessionApiFromJson(jsonString);

import 'dart:convert';

List<GetProfessionApi> getProfessionApiFromJson(String str) => List<GetProfessionApi>.from(json.decode(str).map((x) => GetProfessionApi.fromJson(x)));

String getProfessionApiToJson(List<GetProfessionApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProfessionApi {
  int? id;
  String? name;
  String? image;
  int? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetProfessionApi({
    this.id,
    this.name,
    this.image,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory GetProfessionApi.fromJson(Map<String, dynamic> json) => GetProfessionApi(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "status": status,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
