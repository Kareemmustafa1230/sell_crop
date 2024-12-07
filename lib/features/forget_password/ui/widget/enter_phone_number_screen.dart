import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/forget_password/ui/widget/button_phone_forget_number.dart';
import 'package:sell_your_crop/features/forget_password/ui/widget/resend_otp_bloc_listener.dart';
import 'package:sell_your_crop/features/forget_password/ui/widget/text_form_send_phone.dart';
import '../../../../core/theme/Color/colors.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  const EnterPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
       title: TextApp(text:context.translate(LangKeys.forgetPasswords),style: TextStyleApp.font32black00Weight600,),
        elevation: 0,
      ),
        body: SafeArea(
         child: SingleChildScrollView(
         child: Padding(
           padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: 50.h),
             TextApp(text: context.translate(LangKeys.enterMobileNumber), style: TextStyleApp.font19green73Weight600.copyWith(color:ColorApp.black44 )),
             SizedBox(height: 18.h),
             const TextFormSendPhone(),
             SizedBox(height: 150.h,),
             const ButtonPhoneForgetNumber(),
             const ResendOtpBlocListeners(),
                   ],
               ),
         ),
    ),
        ),
    );
  }
}
