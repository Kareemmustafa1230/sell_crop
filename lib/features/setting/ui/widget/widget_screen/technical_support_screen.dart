import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/setting/ui/widget/button_technical_support.dart';
import 'package:sell_your_crop/features/setting/ui/widget/bloc_listener_widget/technical_support_bloc_listener.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_user/technical_support_user.dart';

class TechnicalSupportScreen extends StatelessWidget {
  const TechnicalSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteFF,
        title: Text(context.translate(LangKeys.technicalSupport),
          style: TextStyleApp.font22black00Weight500.copyWith(fontWeight: FontWeight.w600, color: ColorApp.black00),),
        elevation: 0,
        centerTitle: true,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: ColorApp.black00),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top:8.h,left: 13.w ),
                child: TextApp(text: context.translate(LangKeys.support), style: TextStyleApp.font14black00Weight500.copyWith(fontWeight: FontWeight.w600)),
              ),
              const TechnicalSupportUser(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:13.w),
                child: const ButtonTechnicalSupport(),
              ),
              const TechnicalSupportBlocListeners(),
              SizedBox(height: 90.h),
            ],
          ),
        ),
    );
  }
}
