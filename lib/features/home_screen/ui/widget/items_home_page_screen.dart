import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';

class ItemsHomePageScreen extends StatelessWidget {
  const ItemsHomePageScreen({super.key, required this.text, required this.image, required this.colorText, required this.colorContainer, required this.onTap});
  final String text;
  final String image;
  final Color colorText;
  final Color colorContainer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap ,
      child: Container(
        width: 165.w,
        height:165.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20.r),
          color:colorContainer,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 60.h, width: 60.w,),
            SizedBox(height: 9.h,),
            TextApp(text:text, style: TextStyleApp.font14black00Weight500.copyWith(fontWeight: FontWeight.w600,color:colorText),),
          ],
        ),
      ),
    );
  }
}
