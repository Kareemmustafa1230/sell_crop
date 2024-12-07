import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/sell_cubit.dart';
import '../../../../core/theme/text_style/text_style.dart';
import '../../../../core/widget/text_app.dart';

class ItemsPurchasing extends StatelessWidget {
  const ItemsPurchasing({super.key, required this.type, required this.quantity, required this.price, required this.date, required this.address, required this.listingId, required this.target, required this.targetIf});
  final String type ;
  final String quantity ;
  final String price ;
  final String date ;
  final String address;
  final String listingId;
  final String targetIf;
  final String target;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 20.h, left: 14.w, right: 14.w),
      height: 247.h,
      width: 350.w,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 1,
          color: Colors.green,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(type),
              const Spacer(),
              Container(
                padding: EdgeInsets.only(right: 4.w,left: 4.w),
                width: 106.w,
                height: 28.h,
                decoration: const BoxDecoration(
                    color: ColorApp.goldenrodYellow,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    if (targetIf == 'exportation' || targetIf == 'تصدير') ...[
                      SvgPicture.asset('assets/svg/Subtract.svg', height: 20.h, width: 20.w,),
                      const Spacer(),
                      TextApp(text: target, style: TextStyleApp.font14black00Weight500),
                    ] else ...[
                      SvgPicture.asset('assets/svg/Shop.svg', height: 20.h, width: 20.w,),
                      const Spacer(),
                      TextApp(text: target, style: TextStyleApp.font14black00Weight500),
                    ],
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 9.h,),
          TextApp(text: quantity, style: TextStyleApp.font14black00Weight500),
          SizedBox(height: 10.h,),
          TextApp(text: price, style: TextStyleApp.font14black00Weight500),
          SizedBox(height: 10.h,),
          TextApp(text: date, style: TextStyleApp.font14black00Weight500),
          SizedBox(height: 10.h,),
          TextApp(text: address, style: TextStyleApp.font14black00Weight500),
          SizedBox(height: 10.h,),
          TextApp(text: listingId, style: TextStyleApp.font14black00Weight500),
          Row(
            children: [
              const Spacer(),
              InkWell(
                onTap:() {
                  context.read<SellCubit>().launchWhatsApp();
                },
                  child: SvgPicture.asset('assets/svg/iOS.svg', height: 40.h, width: 40.w,)),
            ],
          ),
        ],
      ),
    );
  }
}
