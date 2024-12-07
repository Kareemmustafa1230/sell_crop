import 'package:freezed_annotation/freezed_annotation.dart';
part 'code_otp_request.g.dart';

@JsonSerializable()
class CodeOtpRequest{
  final String mobile;
  final String otp ;

  CodeOtpRequest({required this.mobile, required this.otp});

  Map<String, dynamic> toJson() => _$CodeOtpRequestToJson(this);

}