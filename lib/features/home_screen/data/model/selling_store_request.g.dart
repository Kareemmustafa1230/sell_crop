// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selling_store_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellingStoreRequest _$SellingStoreRequestFromJson(Map<String, dynamic> json) =>
    SellingStoreRequest(
      genre: json['genre'] as String,
      target: json['target'] as String,
      quantity: json['quantity'] as String,
      price: json['Price'] as String,
      phone: json['phone'] as String,
      cityId: json['city_id'] as String,
      type: json['type'] as String,
      img: (json['img[]'] as List<dynamic>).map((e) => e as String).toList(),
      video: json['video'] as String,
    );

Map<String, dynamic> _$SellingStoreRequestToJson(
        SellingStoreRequest instance) =>
    <String, dynamic>{
      'genre': instance.genre,
      'target': instance.target,
      'quantity': instance.quantity,
      'Price': instance.price,
      'phone': instance.phone,
      'city_id': instance.cityId,
      'type': instance.type,
      'img[]': instance.img,
      'video': instance.video,
    };
