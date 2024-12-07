import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';


class DropdownTextFormFieldApp extends StatefulWidget {
  const DropdownTextFormFieldApp({super.key});

  @override
  _DropdownTextFormFieldAppState createState() => _DropdownTextFormFieldAppState();
}

class _DropdownTextFormFieldAppState extends State<DropdownTextFormFieldApp> {
  final List<String> items = ['farm', 'merchant', 'source'];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: const TextStyle(fontSize: 18, color: ColorApp.black00),
      icon: const Icon(
        FontAwesomeIcons.caretDown,
        color: ColorApp.whiteFF,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyleApp.font14black00Weight500,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: const BorderSide(
            color: ColorApp.grey9D,
            width: 1.5,
          ),
        ),
        fillColor: ColorApp.grey9D,
        filled: true,
        iconColor: ColorApp.whiteFF,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: const BorderSide(
            color: ColorApp.grey9D,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: const BorderSide(
            color: ColorApp.grey9D,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى اختيار وظيفة';
        }
        return null;
      },
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(context.translate(item)),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedItem = newValue;
        });
        if (selectedItem != null) {
          getIt<SharedPrefHelper>().saveData(key: 'selectedItem', value: selectedItem!);
        }
      },
      value: selectedItem,
      isExpanded: true,
      elevation: 8,
    );
  }
}
