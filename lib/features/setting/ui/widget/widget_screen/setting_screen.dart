import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/animate_do.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/forget_password/ui/widget/button_log_out_user.dart';
import 'package:sell_your_crop/features/setting/ui/screen/account_setting.dart';
import 'package:sell_your_crop/features/setting/ui/screen/company_policy.dart';
import 'package:sell_your_crop/features/setting/ui/screen/complaints.dart';
import 'package:sell_your_crop/features/setting/ui/screen/technical_support.dart';
import 'package:sell_your_crop/features/setting/ui/widget/bloc_listener_widget/log_out_bloc_listener.dart';
import 'package:sell_your_crop/features/setting/ui/widget/item_setting_container.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(right: 12.w,left: 12.w),
            child: Column(
              children: [
                SizedBox(height: 30.h,),
            CustomFadeInDown(
              duration: 600,
              // context.translate(LangKeys.accountSettings)
              child:TextApp(text: context.translate(LangKeys.setting), style: TextStyleApp.font20black00Weight600),),
                SizedBox(height: 75.h,),
                 CustomFadeInRight(
                  duration: 500,
                  child:ItemSettingContainer(text: context.translate(LangKeys.accountSettings), image: 'assets/svg/Component.svg', onTap: () {context.pushWithTransition(screen:const AccountSetting());},),),
                SizedBox(height: 27.h,),
                 CustomFadeInLeft(
                  duration: 500,
                  child:ItemSettingContainer(text: context.translate(LangKeys.companyPolicy), image: 'assets/svg/Chield_check.svg', onTap: () { context.pushWithTransition(screen:const CompanyPolicy()); },),),
                SizedBox(height: 27.h,),
                 CustomFadeInRight(
                  duration: 500,
                  child:ItemSettingContainer(text: context.translate(LangKeys.technicalSupport), image: 'assets/svg/problems-support.svg', onTap: () {context.pushWithTransition(screen:const TechnicalSupport());  },),),
                SizedBox(height: 27.h,),
                 CustomFadeInLeft(
                  duration: 500,
                  child:ItemSettingContainer(text: context.translate(LangKeys.complaints), image: 'assets/svg/Info_light.svg', onTap: () {context.pushWithTransition(screen:const Complaints());},),),
                SizedBox(height: 165.h,),
                const ButtonLogOutUser(),
                const LogOutBlocListeners(),
              ],
            ),
          )
      ),
    );
  }
}
