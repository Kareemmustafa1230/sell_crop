// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerResponse _$PartnerResponseFromJson(Map<String, dynamic> json) =>
    PartnerResponse(
      status: (json['status'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PartnerResponseToJson(PartnerResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'img': instance.img,
    };
