import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
part 'selling_store_request.g.dart';

@JsonSerializable()
class SellingStoreRequest{
  final String genre;
  final String target;
  final String quantity;
  @JsonKey(name:'Price')
  final String price;
  final String phone;
  @JsonKey(name:'city_id')
  final String cityId;
  final String type;
  @JsonKey(name:'img[]')
  final List<String> img;
  //final List<XFile> img;
  final String video;

  SellingStoreRequest({required this.genre,
    required this.target,
    required this.quantity,
    required this.price,
    required this.phone,
    required this.cityId,
    required this.type,
    required this.img,
    required this.video
  });

  Map<String, dynamic> toJson() => _$SellingStoreRequestToJson(this);

}