// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'up_data_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpDataPasswordRequest _$UpDataPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    UpDataPasswordRequest(
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      oldPassword: json['old_password'] as String,
    );

Map<String, dynamic> _$UpDataPasswordRequestToJson(
        UpDataPasswordRequest instance) =>
    <String, dynamic>{
      'old_password': instance.oldPassword,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
