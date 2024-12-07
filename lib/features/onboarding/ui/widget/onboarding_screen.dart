import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/features/onboarding/ui/widget/animated_text_kit.dart';
import 'package:sell_your_crop/features/onboarding/ui/widget/onboarding_button_start.dart';
import '../../../../core/theme/Color/colors.dart';
import '../../../../core/theme/image/images.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.green73,
        body:  SafeArea(
        child: Column(
            children: [
              SizedBox(height:27.h ),
              Image.asset(AppImages.onboarding,height: 445.h,width: 335.w,),
              SizedBox(height:48.h ),
              const AnimatedTextKits(),
              SizedBox(height:65.h ),
              const OnboardingButtonStart(),
            ],
          ),
        ),
    );
  }
}
