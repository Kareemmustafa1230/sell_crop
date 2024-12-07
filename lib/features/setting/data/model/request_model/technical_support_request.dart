import 'package:freezed_annotation/freezed_annotation.dart';
part 'technical_support_request.g.dart';


@JsonSerializable()
class TechnicalSupportRequest {
  final String name ;
  final String phone;
  final String subject;
  final String msg;

  TechnicalSupportRequest({
    required this.subject,
    required this.phone,
    required this.msg,
    required this.name,
  });

  Map<String, dynamic> toJson() => _$TechnicalSupportRequestToJson(this);
}
