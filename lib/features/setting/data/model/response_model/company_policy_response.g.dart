// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_policy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyPolicyResponse _$CompanyPolicyResponseFromJson(
        Map<String, dynamic> json) =>
    CompanyPolicyResponse(
      status: (json['status'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$CompanyPolicyResponseToJson(
        CompanyPolicyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
