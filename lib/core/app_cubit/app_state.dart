import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_state.freezed.dart';

@Freezed()
 class AppState<T> with _$AppState<T> {
  const factory AppState.initial() = _Initial;
  const factory AppState.languageChange({required Locale locale}) = LanguageChangeState;

}
