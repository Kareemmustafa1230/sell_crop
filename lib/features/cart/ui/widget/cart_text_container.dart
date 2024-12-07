import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';

class CartTextContainer extends StatelessWidget {
  const CartTextContainer({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 330.w,
        height: 115.h,
        decoration: BoxDecoration(
          color: ColorApp.green73,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: TextApp(text: text, style: TextStyleApp.font20black00Weight600.copyWith(fontSize: 32.sp,color: ColorApp.whiteFF),textAlign: TextAlign.center,),
      ),
    );
  }
}
