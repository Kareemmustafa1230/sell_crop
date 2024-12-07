import 'package:freezed_annotation/freezed_annotation.dart';
part 'number_phone_request.g.dart';

@JsonSerializable()
class NumberPhoneRequest{
  final String mobile;

  NumberPhoneRequest({required this.mobile});

  Map<String, dynamic> toJson() => _$NumberPhoneRequestToJson(this);

}