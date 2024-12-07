import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/sell_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/Color/colors.dart';
import '../../../../core/theme/text_style/text_style.dart';
import '../../../../core/widget/text_app.dart';

class CarouselSliderImages extends StatelessWidget {
  const CarouselSliderImages({super.key, required this.imageUrls, required this.type, required this.quantity, required this.price, required this.date, required this.address, required this.listingId, required this.targetIf, required this.target});
  final String type ;
  final String quantity ;
  final String price ;
  final String date ;
  final String address;
  final String listingId;
  final String targetIf;
  final String target;
  final List<String> imageUrls;
  //final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:5.h,right: 10.w,left: 10.w),
      height: 435.h,
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
          CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, imgIndex, realIndex) {
              return Image.network(
                  imageUrls[imgIndex],
                  width: double.infinity,
                  height: 220.h,
                  fit: BoxFit.fill,
                loadingBuilder:(context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 250.h,
                        color: Colors.white,
                      ),
                    );
                  }
                },
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              height: 300.h,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 5.h,),
          Row(
            children: [
              Text(type),
              const Spacer(),
              Container(
                padding: EdgeInsets.only(right: 4.w,left: 4.w),
                alignment: Alignment.center,
                width: 106.w,
                height: 20.h,
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
          Row(
            children: [
              TextApp(text: quantity, style: TextStyleApp.font14black00Weight500),
              const Spacer(),
              TextApp(text: listingId, style: TextStyleApp.font14black00Weight500),
            ],
          ),
          TextApp(text: price, style: TextStyleApp.font14black00Weight500),
          SizedBox(height: 1.h,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(text: address, style: TextStyleApp.font14black00Weight500),
                  TextApp(text: date, style: TextStyleApp.font14black00Weight500),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                context.read<SellCubit>().launchWhatsApp();
                } ,
                  child: SvgPicture.asset('assets/svg/iOS.svg', height: 35.h, width: 35.w,)),
            ],
          ),
        ],
      ),
    );
  }
}
