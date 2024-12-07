import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/add_crop_user.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/button_sell.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/image_and_video.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/sell_store_bloc_listener.dart';

import '../../../../core/widget/text_app.dart';

class SellRequestScreen extends StatelessWidget {
  const SellRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteFF,
      appBar: AppBar(
        title: Text(context.translate(LangKeys.addACrop),
          style: TextStyleApp.font24whiteFFWeight600.copyWith(color: ColorApp.black00),),
        elevation: 0,
        backgroundColor: ColorApp.whiteFF,
        centerTitle: true,
        clipBehavior: Clip.antiAlias,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               AddCropUser(),
              SizedBox(height: 22.h),
              TextApp(text: context.translate(LangKeys.aDDPicture), style: TextStyleApp.font18black00Weight400),
              SizedBox(height: 35.h),
              const ImageAndVideo(),
              SizedBox(height: 100.h),
              const ButtonSell(),
              const SellStoreBlocListener(),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
