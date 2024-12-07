import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_response.g.dart';


@JsonSerializable()
class SearchResponse {
  int? status;
  String? msg;
  List<Data>? data;

  SearchResponse({this.status, this.msg, this.data});

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>  _$SearchResponseFromJson(json);


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
  @JsonKey(name: 'created_at')
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

  factory Data.fromJson(Map<String, dynamic> json) =>  _$DataFromJson(json);

}