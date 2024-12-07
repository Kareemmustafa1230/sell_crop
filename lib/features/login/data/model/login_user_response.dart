import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_user_response.g.dart';


@JsonSerializable()
class LoginUserResponse {
  LoginUserResponse({
    this.data,
    this.msg,
    this.status,
  });

  Data? data;
  String? msg;
  int? status;

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) =>  _$LoginUserResponseFromJson(json);
}

@JsonSerializable()
class Data {
  Data({
    this.user,
    this.token,
  });

  User? user;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class User {
  User({
    this.id,
    this.name,
    this.mobile,
    this.img,
    this.job,
  });

  int? id;
  String? name;
  String? mobile;
  String? job;
  String? img;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}
