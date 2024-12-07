import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/router/routers.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import '../theme/text_style/text_style.dart';
import 'check_box.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CheckBoxApp(),
          const Spacer(),
          InkWell(
              onTap: (){
                context.pushNamed(Routes.enterPhoneNumber);
              },
              child: TextApp(text:context.translate(LangKeys.forgetPassword), style: TextStyleApp.font15green73Weight500.copyWith(fontSize: 13.sp),)),
        ],

    );
  }
}
