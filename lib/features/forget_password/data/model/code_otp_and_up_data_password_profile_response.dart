import 'package:freezed_annotation/freezed_annotation.dart';
part 'code_otp_and_up_data_password_profile_response.g.dart';


@JsonSerializable()
class CodeOtpAndUpDataPasswordProfileResponse {
  CodeOtpAndUpDataPasswordProfileResponse({
    this.data,
    this.msg,
    this.status,
  });

  Data? data;
  String? msg;
  int? status;

  factory CodeOtpAndUpDataPasswordProfileResponse.fromJson(Map<String, dynamic> json) =>  _$CodeOtpAndUpDataPasswordProfileResponseFromJson(json);
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




