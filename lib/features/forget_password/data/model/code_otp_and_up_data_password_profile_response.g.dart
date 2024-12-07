// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_otp_and_up_data_password_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeOtpAndUpDataPasswordProfileResponse
    _$CodeOtpAndUpDataPasswordProfileResponseFromJson(
            Map<String, dynamic> json) =>
        CodeOtpAndUpDataPasswordProfileResponse(
          data: json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
          msg: json['msg'] as String?,
          status: (json['status'] as num?)?.toInt(),
        );

Map<String, dynamic> _$CodeOtpAndUpDataPasswordProfileResponseToJson(
        CodeOtpAndUpDataPasswordProfileResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'msg': instance.msg,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      img: json['img'] as String?,
      job: json['job'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobile': instance.mobile,
      'job': instance.job,
      'img': instance.img,
    };
