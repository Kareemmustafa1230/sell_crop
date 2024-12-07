import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/features/setting/ui/widget/button_complaint.dart';
import 'package:sell_your_crop/features/setting/ui/widget/bloc_listener_widget/complaint_bloc_listener.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_user/complaints_user.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(context.translate(LangKeys.complaints),
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
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:13.w ,vertical: 48.h),
          child: const Column(
            children: [
              ComplaintsUser(),
              ButtonComplaints(),
              ComplaintBlocListeners(),
            ],
          ),
        ),
      ),
    );
  }
}
