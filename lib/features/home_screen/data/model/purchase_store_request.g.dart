// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_store_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseStoreRequest _$PurchaseStoreRequestFromJson(
        Map<String, dynamic> json) =>
    PurchaseStoreRequest(
      genre: json['genre'] as String,
      target: json['target'] as String,
      quantity: json['quantity'] as String,
      price: json['Price'] as String,
      phone: json['phone'] as String,
      cityId: json['city_id'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$PurchaseStoreRequestToJson(
        PurchaseStoreRequest instance) =>
    <String, dynamic>{
      'genre': instance.genre,
      'target': instance.target,
      'quantity': instance.quantity,
      'Price': instance.price,
      'phone': instance.phone,
      'city_id': instance.cityId,
      'type': instance.type,
    };
