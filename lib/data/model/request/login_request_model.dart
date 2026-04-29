import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable(ignoreUnannotated: false, includeIfNull: false)
class LoginRequestModel {
  @JsonKey(name: 'mobile')
  String? phone;
  @JsonKey(name: 'password')
  String? password;

  LoginRequestModel({this.phone, this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
