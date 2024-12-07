// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpUserRequest _$SignUpUserRequestFromJson(Map<String, dynamic> json) =>
    SignUpUserRequest(
      mobile: json['mobile'] as String,
      password: json['password'] as String,
      job: json['job'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SignUpUserRequestToJson(SignUpUserRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile': instance.mobile,
      'password': instance.password,
      'job': instance.job,
    };
