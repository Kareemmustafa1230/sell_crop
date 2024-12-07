import 'package:freezed_annotation/freezed_annotation.dart';
part 'purchase_store_request.g.dart';

@JsonSerializable()
class PurchaseStoreRequest{
  final String genre;
  final String target;
  final String quantity;
  @JsonKey(name:'Price')
  final String price;
  final String phone;
  @JsonKey(name:'city_id')
  final String cityId;
  final String type;

  PurchaseStoreRequest({required this.genre, required this.target, required this.quantity, required this.price, required this.phone, required this.cityId, required this.type});

  Map<String, dynamic> toJson() => _$PurchaseStoreRequestToJson(this);

}