import 'package:freezed_annotation/freezed_annotation.dart';
part 'cities_response.g.dart';

@JsonSerializable()
class CitiesResponse {
  int? status;
  String? msg;
  List<Data>? data;

  CitiesResponse({this.status, this.msg, this.data});

  factory CitiesResponse.fromJson(Map<String, dynamic> json) =>  _$CitiesResponseFromJson(json);

}

@JsonSerializable()
class Data {
  int? id;
  String? name;

  Data({this.id, this.name});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

}