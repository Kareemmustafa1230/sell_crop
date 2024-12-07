import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import '../../../../core/helpers/animate_do.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/router/routers.dart';
import '../../../../core/theme/Color/colors.dart';
import '../../../../core/theme/text_style/text_style.dart';
import '../../../../core/widget/text_button_screen.dart';

class OnboardingButtonStart extends StatelessWidget {
  const OnboardingButtonStart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: Padding(
        padding: EdgeInsets.only(left:20.w, right:20.w,),
        child: TextButtonScreen(value1: 335.w,value2: 54.h,color: ColorApp.whiteFF,
          child: Text(context.translate(LangKeys.start),style: TextStyleApp.font19green73Weight600,),
          onPressed: (){
            context.pushNamed(Routes.loginScreen);
          },
        ),
      ),
    );
  }
}
