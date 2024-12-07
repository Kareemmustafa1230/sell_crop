import 'package:flutter/material.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';


class GoToSignUpOrIn extends StatelessWidget {
  const GoToSignUpOrIn({super.key, required this.textScreenSignUP, required this.nameKeyScreenSignUp, required this.routeScreen});
   final String textScreenSignUP ;
   final String nameKeyScreenSignUp;
   final String routeScreen;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextApp(text: context.translate(textScreenSignUP), style: TextStyleApp.font14black00Weight500),
        InkWell(
          onTap: (){
            context.pushReplacementNamed(routeScreen);
          },
          child: TextApp(text: context.translate(nameKeyScreenSignUp), style: TextStyleApp.font15green73Weight500.copyWith(fontSize: 16)) ,
        )
      ],
    );
  }
}
