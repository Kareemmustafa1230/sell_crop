import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sell_your_crop/features/home_screen/data/model/cities_response.dart';
part 'cities_state.freezed.dart';

@freezed
class CitiesState<T> with _$CitiesState<T> {
  const factory CitiesState.initial() = _Initial;
  const factory CitiesState.loading() = Loading;
  const factory CitiesState.success({required CitiesResponse citiesResponse}) = Success<T>;
  const factory CitiesState.error({required String error}) = Error;
}