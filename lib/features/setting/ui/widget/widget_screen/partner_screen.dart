import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/partner_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/partner_state.dart';
import 'package:sell_your_crop/features/setting/ui/widget/item_text_image.dart';
import '../../../../../core/theme/Color/colors.dart';
import '../../../../../core/theme/text_style/text_style.dart';

class PartnerScreen extends StatelessWidget {
  const PartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Company owner',
          style: TextStyleApp.font22black00Weight500.copyWith(
              fontWeight: FontWeight.w600, color: ColorApp.black00),),
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
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<PartnerCubit,PartnerState>(
        builder: (context, state) {
          if (state is Success) {
            return Padding(
              padding:  EdgeInsets.only(top: 40.h),
              child: ListView.separated(
                itemCount: state.partnerResponse.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = state.partnerResponse.data![index] ;
                    return ItemTextImage(name: item.name??"", phone: item.phone??"", image: item.img??"");
                  },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(right:100.w,left: 18.w),
                    child: const Divider(
                      thickness: 2,
                      height: 40,
                      color: Color(0xFFB2B2B2),
                    ),
                  );
                },
              ),
            );
          }
          if (state is Loading) {
            return const Center( child:SpinKitFadingCircle(color: Colors.black),
            );
          }
          return  const Center(
            heightFactor: BorderSide.strokeAlignOutside,
            child:  SpinKitFadingCircle(
              color: Colors.red,
              size: 50,
            ),
          );
        },
      ),
    );
  }
}
