import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton({
    required this.hintText,
    required this.onChanged,
    required this.items,
    super.key,
    required this.validator,
    this.onTap,
    this.value,
    this.height,
    this.hasBorder = true,
    this.borderRadius = 10,
    this.borderSideColor,
    this.iconDropColor,
    this.fillColor,
    this.borderSideEnabledColor,
    this.enabledBorderRadiusColor = Colors.grey,
    this.suffixIcon,
  });

  final List<DropdownMenuItem<T>>? items;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Function()? onTap;
  final String hintText;
  final double? height;
  final double borderRadius;
  final Color enabledBorderRadiusColor;
  final Color? borderSideColor;
  final Color? fillColor;
  final Color? iconDropColor;
  final Color? borderSideEnabledColor;
  final bool hasBorder;
  final Widget? suffixIcon;
  final T? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      alignment: Alignment.centerLeft,
      elevation: 0,
      iconSize: 0,
      style:  TextStyleApp.font18black00Weight400,
      decoration: InputDecoration(
        hintStyle:  TextStyleApp.font18black00Weight400,
        suffixIcon: suffixIcon ??  const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 30,
        color: ColorApp.black00,
      ),
        labelStyle: TextStyleApp.font18black00Weight400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: const BorderSide(
            color:  Colors.black,
            width: 1,
          ),
        ),
        fillColor: ColorApp.whiteFF,
        filled: true,
        iconColor: ColorApp.whiteFF,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: const BorderSide(
            color:  Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: const BorderSide(
            color:  Colors.grey,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 0.6,
          ),
        ),
      ),      value: value,
      isExpanded: true,
      hint: Text(
        hintText,
        style: TextStyleApp.font18black00Weight400,
      ),
      items: items,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
