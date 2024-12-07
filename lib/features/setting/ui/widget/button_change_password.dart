import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';

class ButtonChangePassword extends StatelessWidget {
  const ButtonChangePassword({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width:140.w ,
        height: 40.h,
        decoration: BoxDecoration(
            color: ColorApp.grey9D,
            borderRadius: BorderRadius.circular(15.r)
        ),
        child: TextApp(text: context.translate(LangKeys.changePassword), style: TextStyleApp.font14black00Weight500,),
      ),
    );
  }
}
