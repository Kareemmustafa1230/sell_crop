import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/technical_support_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/technical_support_state.dart';
import '../../../../core/helpers/animate_do.dart';
import '../../../../core/theme/text_style/text_style.dart';
import '../../../../core/widget/text_button_screen.dart';

class ButtonTechnicalSupport extends StatelessWidget {
  const ButtonTechnicalSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnicalSupportCubit, TechnicalSupportState>(
        builder: (context, state) {
          return state is Loading
              ? const Center(
            child: SpinKitFadingCircle(color: Colors.green),
          )
              : CustomFadeInRight(
        duration: 600,
        child: TextButtonScreen(
          color: ColorApp.green73,
          value2: 54.h,
          value1: double.infinity,
          onPressed: () {
              validateThenDoTechnicalSupport(context);
          },
          child: Text(context.translate(LangKeys.send),
            style: TextStyleApp.font19green73Weight600.copyWith(
                color: ColorApp.whiteFF),
          ),
        ),
      );
      }
     );
  }
}

  void validateThenDoTechnicalSupport(BuildContext context) {
    if (context.read<TechnicalSupportCubit>().formKey.currentState!.validate()) {
        context.read<TechnicalSupportCubit>().emitTechnicalSupportState();
    }
  }

