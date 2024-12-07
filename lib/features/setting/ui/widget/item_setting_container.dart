import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';

class ItemSettingContainer extends StatelessWidget {
  const ItemSettingContainer({super.key, required this.text, required this.image, required this.onTap});
  final String text ;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.only(left:9.w,right: 9.w),
        width:350.w,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
            color: Colors.grey,
            width: 1
        ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(image, height: 25.h, width: 25.w,),
            SizedBox(width: 20.w,),
            Text(text, style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),

        ],),
      ),
    );
  }
}
