// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeOtpRequest _$CodeOtpRequestFromJson(Map<String, dynamic> json) =>
    CodeOtpRequest(
      mobile: json['mobile'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$CodeOtpRequestToJson(CodeOtpRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'otp': instance.otp,
    };
