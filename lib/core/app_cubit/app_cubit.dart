import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helpers/shared_pref_helper.dart';
import '../networking/constants/api_constants.dart';
import '../networking/di/dependency_injection.dart';
import 'app_state.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  bool isDark = true ;
  String languageCode = 'en';


  //Language getSavedLanguage
  Future<void> getSavedLanguage()async{
    final result = await SharedPrefHelper().containsKey(key: ApiKey.language)
        ? getIt<SharedPrefHelper>().getData(key: ApiKey.language)
        : 'en';
    languageCode = result! ;
    emit(AppState.languageChange(locale: Locale(languageCode)));
    }

  //Language change
    Future<void> _changeLanguage(String language)async{
    await getIt<SharedPrefHelper>().saveData(key: ApiKey.language, value: language);
    languageCode = language;
    emit(AppState.languageChange(locale: Locale(languageCode)));
    }

    void toArabic() => _changeLanguage('ar');
    void toEnglish() => _changeLanguage('en');

}
