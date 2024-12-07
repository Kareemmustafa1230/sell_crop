import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextButtonScreen extends StatelessWidget {
  final Color color;
  final VoidCallback? onPressed;
  final double value1;
  final double value2;
  final Widget child;
  const TextButtonScreen({super.key,  required this.color, this.onPressed, required this.value2, required this.child, required this.value1});

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
           Size(value1.w, value2.h)
        ),
        elevation: MaterialStateProperty.all<double>(0),
      ),
      child: child ,
    );

  }
}
