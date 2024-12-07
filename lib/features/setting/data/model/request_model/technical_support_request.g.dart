// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technical_support_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechnicalSupportRequest _$TechnicalSupportRequestFromJson(
        Map<String, dynamic> json) =>
    TechnicalSupportRequest(
      subject: json['subject'] as String,
      phone: json['phone'] as String,
      msg: json['msg'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TechnicalSupportRequestToJson(
        TechnicalSupportRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'subject': instance.subject,
      'msg': instance.msg,
    };
