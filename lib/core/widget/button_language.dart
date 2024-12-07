import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/app_cubit/app_cubit.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/app_localizations.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';

import '../helpers/animate_do.dart';

class ButtonLanguage extends StatelessWidget {
  const ButtonLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInLeft(
      duration: 400,
      child:InkWell(
        onTap: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            context.read<AppCubit>().toArabic();
          } else {
            context.read<AppCubit>().toEnglish();
          }
        },
        child: Container(
          width: 95.w,
          height: 45.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(color: Colors.green, width: 2)),
          child: TextApp(
              text: context.translate(LangKeys.language),
              style: TextStyleApp.font22black00Weight500),
        ),
      ),
    );
  }
}
