import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable(ignoreUnannotated: false, includeIfNull: false)
class SignUpRequestModel {
  @JsonKey(name: "full_name")
  String? fullName;
  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: 'mobile')
  String? phone;
  @JsonKey(name: 'password')
  String? password;

  SignUpRequestModel({this.fullName, this.email, this.phone, this.password});

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
