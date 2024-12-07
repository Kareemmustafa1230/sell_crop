import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/animate_do.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/app-text-form-field.dart';
import 'package:sell_your_crop/core/widget/custom_dropdown_form_field.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/cities_cubit.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/cities_state.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_cubit.dart';
import 'package:shimmer/shimmer.dart';

class AddCropUser extends StatelessWidget {
   AddCropUser({super.key});
  final List<String> items = ['exportation', 'local'];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SellingStoreCubit>();
    return Form(
      key: context.read<SellingStoreCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
              text: context.translate(LangKeys.type),
              style: TextStyleApp.font18black00Weight400),
          CustomFadeInRight(
            duration: 500,
            child: TextFormFieldApp(
                enableBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.grey, width: 1.w,),
                ),
                focusBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.grey, width: 1.w),
                ),
                controller: context.read<SellingStoreCubit>().genreController,
                background: ColorApp.whiteFF,
                hintStyle: const TextStyle(
                  color: ColorApp.black00,
                ),
                inputTextStyle: const TextStyle(
                  color: ColorApp.black00,
                ),
                textInputType: TextInputType.name,
                hintText: ''
              //context.translate(LangKeys.enter),
            ),
          ),
          SizedBox(height: 20.h), TextApp(
              text: context.translate(LangKeys.target),
              style: TextStyleApp.font18black00Weight400),
          CustomFadeInRight(
            duration: 500,
            child: CustomDropDownButton(
              hintText: '',
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(context.translate(item)),
                );
              }).toList(),
              onChanged: (value) {
                cubit.target = value!;
              },
              validator: (value) {
                if (value == null) return context.translate(LangKeys.start);
                return null;
              },
            ),
          ),
          SizedBox(height: 20.h),
          TextApp(
              text: context.translate(LangKeys.quantity),
              style: TextStyleApp.font18black00Weight400),
          CustomFadeInRight(
            duration: 500,
            child: TextFormFieldApp(
                controller: context.read<SellingStoreCubit>().quantityController,
                enableBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.grey, width: 1.w,),
                ),
                focusBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.grey, width: 1.w),
                ),
                background: ColorApp.whiteFF,
                hintStyle: const TextStyle(
                  color: ColorApp.black00,
                ),
                inputTextStyle: const TextStyle(
                  color: ColorApp.black00,
                ),
                textInputType: TextInputType.name,
                hintText: ''
              //context.translate(LangKeys.enterName),
            ),
          ),
          SizedBox(height: 20.h), TextApp(
              text: context.translate(LangKeys.cropPrice),
              style: TextStyleApp.font18black00Weight400),
          CustomFadeInRight(
            duration: 500,
            child: TextFormFieldApp(
                controller: context.read<SellingStoreCubit>().priceController,
                enableBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.grey, width: 1.w,),
                ),
                focusBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.grey, width: 1.w),
                ),
                background: ColorApp.whiteFF,
                hintStyle: const TextStyle(
                  color: ColorApp.black00,
                ),
                inputTextStyle: const TextStyle(
                  color: ColorApp.black00,
                ),
                textInputType: TextInputType.number,
                hintText: ''
              //context.translate(LangKeys.enterName),
            ),
          ),
          SizedBox(height: 20.h),
          TextApp(text: context.translate(LangKeys.address),
              style: TextStyleApp.font18black00Weight400),
          BlocBuilder<CitiesCubit, CitiesState>(
            builder: (context, state) {
              if (state is Loading) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Container(
                        width: double.infinity,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is Success) {
                final items = state.citiesResponse.data?.map((city) {
                  return DropdownMenuItem(
                    alignment: Alignment.centerLeft,
                    value: city.id,
                    child: Text(city.name ?? ''),
                  );
                }).toList();
                return CustomFadeInRight(
                  duration: 500,
                  child: CustomDropDownButton(
                    hintText: 'Address',
                    items: items,
                    onChanged: (value) {
                      cubit.cityId = value;
                    },
                    validator: (value) {
                      if (value == null) return context.translate(LangKeys.start);
                      return null;
                    },
                  ),
                );
              } else if (state is Error) {
                return Center(child: Text(state.error));
              } else {
                return Container();
              }
            },
          ),
          SizedBox(height: 20.h),
          TextApp(text: context.translate(LangKeys.numberPhone), style: TextStyleApp.font18black00Weight400),
          CustomFadeInRight(
            duration: 500,
            child: TextFormFieldApp(
              controller: context.read<SellingStoreCubit>().phoneController,
              enableBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.grey, width: 1.w,),
              ),
              focusBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.grey, width: 1.w),
              ),
              background: ColorApp.whiteFF,
              hintStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              inputTextStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              textInputType: TextInputType.phone,
              hintText: context.translate(LangKeys.enterNumberPhone),
            ),
          ),
        ],
      ),
    );
  }
}
