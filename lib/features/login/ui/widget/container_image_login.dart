import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/image/images.dart';

class ContainerImageLogin extends StatelessWidget {
  const ContainerImageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 300.h,
      decoration: BoxDecoration(
        color: ColorApp.green73,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -40.h,
            top: -5.h,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.imageLogin,
              height: 331.h,
              width: 311,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }
}
