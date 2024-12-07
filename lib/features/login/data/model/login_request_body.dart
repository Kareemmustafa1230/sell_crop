import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody{
 final String mobile;
 final String password;

 LoginRequestBody({required this.mobile, required this.password});

 Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);

}