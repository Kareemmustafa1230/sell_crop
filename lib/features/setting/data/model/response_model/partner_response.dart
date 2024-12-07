import 'package:freezed_annotation/freezed_annotation.dart';
part 'partner_response.g.dart';


@JsonSerializable()
class PartnerResponse {
  int? status;
  String? msg;
  List<Data>? data;

  PartnerResponse({this.status, this.msg, this.data});

  factory PartnerResponse.fromJson(Map<String, dynamic> json) =>  _$PartnerResponseFromJson(json);

}

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? phone;
  String? img;

  Data({this.id, this.name, this.phone, this.img});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}