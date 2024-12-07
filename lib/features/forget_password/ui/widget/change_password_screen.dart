import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/forget_password/ui/widget/button_change_password_user.dart';
import 'package:sell_your_crop/features/forget_password/ui/widget/change_password_bloc_listener.dart';
import 'package:sell_your_crop/features/forget_password/ui/widget/change_password_user.dart';


class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 33.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(text: context.translate(LangKeys.changePassword), style: TextStyleApp.font24whiteFFWeight600.copyWith(color:ColorApp.black00 ,fontWeight: FontWeight.w700)),
                SizedBox(height: 20.h),
                TextApp(text:context.translate(LangKeys.rememberPassword) ,style: TextStyleApp.font14black00Weight500),
                SizedBox(height: 30.h),
                const ChangePasswordUser(),
                SizedBox(height: 150.h,),
                const ButtonChangePasswordUser(),
                const ChangePasswordBlocListeners(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
