import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';

class PictureImageOrVideo extends StatelessWidget {
  const PictureImageOrVideo({super.key, required this.onTap, required this.icon});
  final VoidCallback onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 88.h,
        decoration:BoxDecoration(
            color: ColorApp.grey9D,
            borderRadius: BorderRadius.circular(15)
        ) ,
        child: icon,
      ),
    );
  }
}
