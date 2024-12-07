import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_profile_response.g.dart';


@JsonSerializable()
class GetProfileResponse {
  int? status;
  String? msg;
  Data? data;

  GetProfileResponse({this.status, this.msg, this.data});

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>  _$GetProfileResponseFromJson(json);


}

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? mobile;
  String? img;
  String? job;

  Data({this.id, this.name, this.mobile, this.img, this.job});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

}