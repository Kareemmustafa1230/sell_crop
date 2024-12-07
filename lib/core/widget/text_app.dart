import 'package:flutter/cupertino.dart';

class TextApp extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int? maxLine;
  final bool? softWrap;
  final TextOverflow? texOverFlow;
  final TextAlign? textAlign;
  const TextApp({super.key, required this.text, required this.style, this.maxLine, this.softWrap, this.texOverFlow, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        softWrap: softWrap,
        textAlign: textAlign,
        overflow: texOverFlow,
        maxLines: maxLine,
        style: style
    );
  }
}
