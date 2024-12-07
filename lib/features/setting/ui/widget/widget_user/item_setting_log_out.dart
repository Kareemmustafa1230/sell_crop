import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/log_out_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/log_out_state.dart';

class ItemSettingLogOut extends StatelessWidget {
  const ItemSettingLogOut({super.key, required this.text, required this.image});
  final String text ;
  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogOutCubit,LogOutState>(
        builder: (context, state) {
      return state is Loading
          ?  const Center(
        child: SpinKitFadingCircle(color: Colors.green),
      ) : InkWell(
      onTap:(){context.read<LogOutCubit>().emitLogOutState();} ,
      child: Container(
        padding: EdgeInsets.only(left:9.w,right: 9.w),
        width:350.w,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
              color: Colors.grey,
              width: 1
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(image, height: 25.h, width: 25.w,),
            SizedBox(width: 20.w,),
            Text(text, style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),

          ],
        ),
      ),
      );
        }
    );
  }
}