import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/widget/button_language.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_state.dart';
import '../../../../core/helpers/animate_do.dart';
import '../../../../core/language/app_localizations.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/theme/text_style/text_style.dart';
import '../../../../core/widget/text_app.dart';

class LogoAndButtonLang extends StatelessWidget {
  const LogoAndButtonLang({super.key, required this.nameKey});
 final String nameKey ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return CustomFadeInRight(
              duration: 400,
              child: TextApp(
                  text: context.translate(nameKey),
                  style: TextStyleApp.font27black00Weight700),
            );
          },
        ),
        const Spacer(),
        const ButtonLanguage(),
      ],
    );
  }
}
