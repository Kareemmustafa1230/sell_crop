import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import '../networking/constants/api_constants.dart';
import '../networking/di/dependency_injection.dart';

class FontFamilyHelper{
  const FontFamilyHelper._();

  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

  static String geLocalozedFontFamily(){

    final currentLanguage = getIt<SharedPrefHelper>().getData(key: ApiKey.language);
    if(currentLanguage == 'ar'){
      return cairoArabic ;
    }else{
      return poppinsEnglish;
    }
  }
}