// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_store_and_selling_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseAndSellingStoreResponse _$PurchaseAndSellingStoreResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseAndSellingStoreResponse(
      status: (json['status'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurchaseAndSellingStoreResponseToJson(
        PurchaseAndSellingStoreResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      genre: json['genre'] as String?,
      target: json['target'] as String?,
      quantity: json['quantity'] as String?,
      price: json['Price'] as String?,
      phone: json['phone'] as String?,
      video: json['video'] as String?,
      city: json['city'] as String?,
      user: json['user'] as String?,
      img: (json['img'] as List<dynamic>?)?.map((e) => e as String).toList(),
      type: json['type'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'genre': instance.genre,
      'target': instance.target,
      'quantity': instance.quantity,
      'Price': instance.price,
      'phone': instance.phone,
      'video': instance.video,
      'city': instance.city,
      'user': instance.user,
      'img': instance.img,
      'type': instance.type,
      'created_at': instance.createdAt,
    };
