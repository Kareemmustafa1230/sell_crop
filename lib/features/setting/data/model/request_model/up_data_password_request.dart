import 'package:freezed_annotation/freezed_annotation.dart';
part 'up_data_password_request.g.dart';


@JsonSerializable()
class UpDataPasswordRequest {
  @JsonKey(name:'old_password')
  final String oldPassword ;
  final String password;
  @JsonKey(name:'password_confirmation')
  final String passwordConfirmation;

  UpDataPasswordRequest({
    required this.password,
    required this.passwordConfirmation,
    required this.oldPassword,
  });

  Map<String, dynamic> toJson() => _$UpDataPasswordRequestToJson(this);
}
