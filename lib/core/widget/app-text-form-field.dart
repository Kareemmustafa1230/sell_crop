import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/Color/colors.dart';
import '../theme/text_style/text_style.dart';

class TextFormFieldApp extends StatefulWidget {
  final TextAlign? textAlign;
  final Color? iconColor ;
  final EdgeInsetsDirectional? contentPadding;
  bool isPassword;
  bool showEye;
  bool hasBorder;
  bool hasCons;
  bool autoFocus;
  bool readOnly;
  bool isFilled;
  Function? onTap;
  Widget? prefixIcon;
  Function(String)? onFilledSubmit;
  Widget? suffixIcon;
  final InputBorder? focusBorder;
  final InputBorder? enableBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final int? maxLines;
  final bool? isSecureText;
  Function(String)? onChange;
  String? validationMsg;
  final TextInputType? textInputType;
  final Color? background;
  final TextEditingController? controller;
  final Function? validator;
  final BorderRadius? borderRadius;

  TextFormFieldApp({
    super.key,
    this.iconColor,
    this.isPassword = false,
    this.contentPadding,
    this.textInputType,
    this.focusBorder,
    this.autoFocus = false,
    this.readOnly = false,
    this.isFilled = false,
    this.showEye = true,
    this.hasBorder = true,
    this.hasCons = false,
    this.onTap,
    this.maxLines,
    this.enableBorder,
    this.inputTextStyle,
    this.validationMsg,
    this.hintStyle,
    required this.hintText,
    this.isSecureText,
    this.suffixIcon,
    this.background,
    this.onFilledSubmit,
    this.controller,
    this.validator,
    this.onChange,
    this.textAlign,
    this.borderRadius,
    this.prefixIcon,
  });

  @override
  State<TextFormFieldApp> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<TextFormFieldApp> {
  late FocusNode myFocusNode;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType?? TextInputType.text,
      textAlign: widget.textAlign ?? TextAlign.start,
      obscureText: widget.isPassword && hidePassword,
      focusNode: myFocusNode,
      style: widget.inputTextStyle ?? TextStyleApp.font18black00Weight400,
      controller: widget.controller,
      textAlignVertical:TextAlignVertical.top,
      maxLines: widget.maxLines ?? 1,
      onFieldSubmitted: (value) {
        if (widget.onFilledSubmit != null) {
          widget.onFilledSubmit!(value);
        }
      },
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        fillColor: widget.background ?? ColorApp.green73,
        filled: true,
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        hintStyle: widget.hintStyle ?? TextStyleApp.font18black00Weight400,
        hintText: widget.hintText,
        suffixIcon: widget.showEye && widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          icon: Icon(
            hidePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: widget.iconColor ?? ColorApp.whiteFF,
          ),
          iconSize: 23,
        )
            : widget.suffixIcon,
        enabledBorder: widget.enableBorder ??
            OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(16.w),
              borderSide: BorderSide(color: ColorApp.greyEA, width: 0.2.w),
            ),
        focusedBorder: widget.focusBorder ??
            OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(16.w),
              borderSide: BorderSide(color: ColorApp.greyEA, width: 0.2.w),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
        ),
      ),
        validator: (value) {
          if (widget.validator != null) {
            return widget.validator!(value);
          }
          return null;
          },
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      onChanged: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}
