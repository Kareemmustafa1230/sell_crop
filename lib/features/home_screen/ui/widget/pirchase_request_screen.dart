import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/button_purchase.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/purchase_crop_user.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/purchase_store_bloc_listener.dart';

class PurchaseRequestScreen extends StatelessWidget {
  const PurchaseRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteFF,
      appBar: AppBar(
        title: Text(context.translate(LangKeys.purchaseRequest),
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
            children: [
               PurchaseCropUser(),
              SizedBox(height: 85.h),
              const ButtonPurchase(),
              const PurchaseStoreBlocListener(),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
