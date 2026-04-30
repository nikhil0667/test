// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['mobile'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      'full_name': ?instance.fullName,
      'email': ?instance.email,
      'mobile': ?instance.phone,
      'password': ?instance.password,
    };
