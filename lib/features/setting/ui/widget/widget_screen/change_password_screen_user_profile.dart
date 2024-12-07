import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/setting/ui/widget/bloc_listener_widget/up_data_new_password_profile_bloc_listener.dart';
import 'package:sell_your_crop/features/setting/ui/widget/button_save_new_password_profile_user.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_user/change_password_profile_user.dart';

class ChangePasswordScreenUserProfile extends StatelessWidget {
  const ChangePasswordScreenUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: ColorApp.whiteFF,
      body: SafeArea(
          child:  SingleChildScrollView(
           child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: TextApp(text: context.translate(LangKeys.changePassword), style: TextStyleApp.font20black00Weight600.copyWith(fontWeight: FontWeight.w700))),
                SizedBox(height: 30.h),
                TextApp(text: context.translate(LangKeys.writeRemember), style: TextStyleApp.font14black00Weight500.copyWith(fontWeight: FontWeight.w600)),
                SizedBox(height: 35.h),
                const ChangePasswordProfileUser(),
                SizedBox(height: 105.h),
                const ButtonSaveNewPasswordProfileUser(),
                const UpDataNewPasswordProfileBlocListener(),
              ],
            ),
          )
      ),
      ),
    );
  }
}
