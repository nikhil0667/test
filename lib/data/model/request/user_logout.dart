import 'package:json_annotation/json_annotation.dart';

part 'user_logout.g.dart';

@JsonSerializable()
class UserLogout {
  @JsonKey(name: "user_id")
  int? userId;

  UserLogout({this.userId});

  factory UserLogout.fromJson(Map<String, dynamic> json) =>
      _$UserLogoutFromJson(json);

  Map<String, dynamic> toJson() => _$UserLogoutToJson(this);
}
