// To parse this JSON data, do
//
//     final users = usersFromMap(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'users.g.dart';

Users usersFromMap(String str) => Users.fromJson(json.decode(str));

String usersToMap(Users data) => json.encode(data.toJson());

@JsonSerializable()
class Users {
  @JsonKey(name: "user")
  User? user;

  Users({
    this.user,
  });

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "avatar")
  String? avatar;

  User({
    this.id,
    this.name,
    this.mobile,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
