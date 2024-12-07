import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/router/routers.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import '../theme/Color/colors.dart';
import '../theme/text_style/text_style.dart';

class CheckBoxApp extends StatefulWidget {
  const CheckBoxApp({super.key});

  @override
  State<CheckBoxApp> createState() => _CheckBoxAppState();
}

class _CheckBoxAppState extends State<CheckBoxApp> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: 0.8,
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide(
              color: ColorApp.green73,
              width: 1.w,
            ),
            hoverColor: ColorApp.green73,
            checkColor: ColorApp.whiteFF,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return ColorApp.grey9D;
              }
              return Colors.transparent;
            }),
            value: _rememberMe,
            onChanged: (bool? value) {
              setState(() {
                _rememberMe = value!;
                ApiConstants.valid = _rememberMe ;
              });
            },
          ),
        ),
        InkWell(
          onTap: (){
            context.pushNamed(Routes.companyPolicy);
          },
            child: TextApp(text: context.translate(LangKeys.approvalCompany), style: TextStyleApp.font15green73Weight500.copyWith(color: ColorApp.black00,fontSize: 12.sp,decoration: TextDecoration.underline,),)),
      ],
    );
  }
}
