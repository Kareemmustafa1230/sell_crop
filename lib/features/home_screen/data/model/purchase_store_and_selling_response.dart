import 'package:freezed_annotation/freezed_annotation.dart';
part 'purchase_store_and_selling_response.g.dart';


@JsonSerializable()
class PurchaseAndSellingStoreResponse {
  int? status;
  String? msg;
  Data? data;

  PurchaseAndSellingStoreResponse({this.status, this.msg, this.data});

  factory PurchaseAndSellingStoreResponse.fromJson(Map<String, dynamic> json) =>  _$PurchaseAndSellingStoreResponseFromJson(json);

}

@JsonSerializable()
class Data {
  int? id;
  String? genre;
  String? target;
  String? quantity;
  @JsonKey(name:'Price')
  String? price;
  String? phone;
  String? video;
  String? city;
  String? user;
  List<String>? img;
  String? type;
  @JsonKey(name:'created_at')
  String? createdAt;

  Data(
      {this.id,
        this.genre,
        this.target,
        this.quantity,
        this.price,
        this.phone,
        this.video,
        this.city,
        this.user,
        this.img,
        this.type,
        this.createdAt});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

}