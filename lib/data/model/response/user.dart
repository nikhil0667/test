// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user.g.dart';

User userFromMap(String str) => User.fromJson(json.decode(str));

String userToMap(User data) => json.encode(data.toJson());

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "full_name")
  String? fullName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "avatar")
  String? avatar;

  User({
    this.id,
    this.fullName,
    this.email,
    this.mobile,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
