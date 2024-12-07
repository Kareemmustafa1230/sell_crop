import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/features/login/logic/cubit/login_cubit.dart';
import '../../../../core/helpers/animate_do.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/theme/text_style/text_style.dart';
import '../../../../core/widget/text_button_screen.dart';
import '../../logic/cubit/login_state.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state is Loading
            ? const Center(
                child: SpinKitFadingCircle(color: Colors.green),
              )
            : CustomFadeInRight(
                duration: 600,
                child: TextButtonScreen(
                  value1: double.infinity,
                  value2: 54.h,
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                  color: ColorApp.green73,
                  child: Text(
                    context.translate(LangKeys.login),
                    style: TextStyleApp.font19green73Weight600.copyWith(color: ColorApp.whiteFF),
                  ),
                ),
              );
       },
     );
  }
}

void validateThenDoLogin(BuildContext context) {
  if(ApiConstants.valid == true ){
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
  }
  }else{
   return print('karem');
  }
}