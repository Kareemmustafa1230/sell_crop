import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_user_request.g.dart';

@JsonSerializable()
class SignUpUserRequest{
  final String name ;
  final String mobile;
  final String password;
  final String job;

  SignUpUserRequest({
  required this.mobile,
  required this.password,
  required this.job,
  required this.name,
  });

  Map<String, dynamic> toJson() => _$SignUpUserRequestToJson(this);

}