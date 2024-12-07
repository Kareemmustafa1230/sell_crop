// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintRequest _$ComplaintRequestFromJson(Map<String, dynamic> json) =>
    ComplaintRequest(
      phone: json['phone'] as String,
      msg: json['msg'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ComplaintRequestToJson(ComplaintRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'msg': instance.msg,
    };
