// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  fullName: json['full_name'] as String?,
  email: json['email'] as String?,
  mobile: json['mobile'] as String?,
  avatar: json['avatar'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'email': instance.email,
  'mobile': instance.mobile,
  'avatar': instance.avatar,
};
