import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/theme/text_style/text_style.dart';

class AnimatedTextKits extends StatelessWidget {
  const AnimatedTextKits({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(context.translate(LangKeys.exportBuySellCrop),
          speed: const Duration(milliseconds: 130),
          textStyle: TextStyleApp.font24whiteFFWeight600,textAlign: TextAlign.center,
        ),
      ],
      isRepeatingAnimation: true,
      repeatForever: true,
      displayFullTextOnTap: true,
      stopPauseOnTap: false,
    );
  }
}
