import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/button_language.dart';
import 'package:sell_your_crop/features/setting/ui/screen/change_password_user_profile.dart';
import 'package:sell_your_crop/features/setting/ui/widget/button_change_password.dart';
import 'package:sell_your_crop/features/setting/ui/widget/button_save_profile_user.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_user/update_profile_user.dart';
import '../../../../../core/theme/Color/colors.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text( context.translate(LangKeys.accountSettings),
          style: TextStyleApp.font22black00Weight500.copyWith(fontWeight: FontWeight.w600, color: ColorApp.black00),
        ),
        elevation: 0,
        centerTitle: true,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: ColorApp.black00,width: 0.5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )),
        backgroundColor: Colors.white,
      ),
      body:  SingleChildScrollView(
    child:Padding(
        padding:  EdgeInsets.symmetric(horizontal:12.w , vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  Center(child: Image.asset('assets/images/image_account.png',height: 100,width: 100,)),
            const Row(
              children: [
              Spacer(),
              ButtonLanguage(),
            ],),
           const UpdateProfileUser(),
            SizedBox(height: 29.h),
            ButtonChangePassword(onTap: (){context.pushWithTransition(screen:const ChangePasswordUserProfile());}),
            SizedBox(height: 56.h),
            const ButtonSaveProfileUser(),
          ],
        ),
      ),
      ),
    );
  }
}
