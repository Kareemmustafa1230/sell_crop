import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/company_policy_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/company_policy_state.dart';

class CompanyPolicyScreen extends StatelessWidget {
  const CompanyPolicyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          context.translate(LangKeys.companyPolicy),
          style: TextStyleApp.font22black00Weight500
              .copyWith(fontWeight: FontWeight.w600, color: ColorApp.black00),
        ),
        elevation: 0,
        centerTitle: true,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: ColorApp.black00),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<CompanyPolicyCubit, CompanyPolicyState>(
        builder: (context, state) {
          if (state is Success) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Text(
                  '${state.companyPolicyResponse.data}',
                  style: TextStyleApp.font14black00Weight500,
                ),
              ),
            );
          }
          if (state is Loading) {
            return const Center(
              child: SpinKitFadingCircle(color: Colors.black),
            );
          }
          return const Center(
            heightFactor: BorderSide.strokeAlignOutside,
            child: SpinKitFadingCircle(
              color: Colors.red,
              size: 50,
            ),
          );
        },
      ),
    );
  }
}
