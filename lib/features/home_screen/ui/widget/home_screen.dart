import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/features/home_screen/ui/screen/purchase_request.dart';
import 'package:sell_your_crop/features/home_screen/ui/screen/sell_request.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/items_home_page_screen.dart';
import 'package:sell_your_crop/features/setting/ui/screen/partner.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 35.h),
              Text(context.translate(LangKeys.homePage), style: TextStyleApp.font22black00Weight500.copyWith(fontWeight: FontWeight.w600, color: ColorApp.black00),),
              SizedBox(height: 25.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Image.asset('assets/images/aya.png', height: 60.h, width: double.infinity,),
              ),
              SizedBox(height: 90.h),
              Row(
               mainAxisAlignment:MainAxisAlignment.center,
               children: [
                  ItemsHomePageScreen(text: context.translate(LangKeys.purchaseRequest), image: 'assets/images/purchase.png', colorText:ColorApp.brown40, colorContainer: ColorApp.redED, onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const PurchaseRequest(),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                    },),
                  SizedBox(width: 12.w),
                  ItemsHomePageScreen(text: context.translate(LangKeys.sellRequest), image: 'assets/images/sell.png', colorText: ColorApp.blueC1, colorContainer: ColorApp.greenE4, onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const SellRequest(),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );},),
               ],
             ),
              SizedBox(height: 8.h),
               ItemsHomePageScreen(text:  context.translate(LangKeys.companyOwnerData), image: 'assets/images/company.png', colorText: ColorApp.purpleD1, colorContainer: ColorApp.purpleD9, onTap: () {
                 PersistentNavBarNavigator.pushNewScreen(
                   context,
                   screen: const Partner(),
                   withNavBar: false,
                   pageTransitionAnimation: PageTransitionAnimation.fade,
                 );
                 },),
            ],
          ),
        ),
      )
    );
  }
}
