import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/features/search/logic/cubit/search_cubit.dart';
import 'package:sell_your_crop/features/search/logic/cubit/search_state.dart';
import 'package:sell_your_crop/features/search/ui/widget/caroisel_slider_images.dart';
import 'package:sell_your_crop/features/search/ui/widget/items_purchasing.dart';
import 'package:sell_your_crop/features/search/ui/widget/items_video.dart';
import '../../../../core/widget/app-text-form-field.dart';

class ScreenScreen extends StatelessWidget {
  const ScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormFieldApp(
                    prefixIcon: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..scale(-1.0, 1.0),
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    enableBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(
                        color: Color(0xFFAAAAAA),
                        width: 1,
                      ),
                    ),
                    focusBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(
                        color: Color(0xFFAAAAAA),
                        width: 1,
                      ),
                    ),
                    hintStyle: const TextStyle(
                      color: ColorApp.black00,
                    ),
                    textInputType: TextInputType.text,
                    background: const Color(0xFFD9D9D9),
                    hintText: context.translate(LangKeys.search),
                    controller: cubit.searchController,
                    onChange: (String value) {
                      context.read<SearchCubit>().emitSearchState(searchQuery: value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Search is required';
                      }
                      return 'null';
                    },
                  ),
                  const SizedBox(height: 20),
                  if (state is Loading)
                    const Expanded(
                      child: Center(
                        child: SpinKitFadingCircle(color: ColorApp.black00),
                      ),
                    ),
                  if (state is Success)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.searchResponse.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = state.searchResponse.data![index];
                          if (item.img != null && item.img!.isNotEmpty) {
                            return CarouselSliderImages(
                                imageUrls: item.img!, type:"${context.translate(LangKeys.type)}: ${item.id ?? ""}",
                                quantity: '${context.translate(LangKeys.quantity)}: ${item.quantity?? ""}',
                                price: '${context.translate(LangKeys.price)}: ${item.price?? ""}',
                                date: '${context.translate(LangKeys.data)}: ${item.createdAt?? ""}',
                                address: '${context.translate(LangKeys.address)}: ${item.city}',
                                listingId:"${context.translate(LangKeys.listingId)}: ${item.id?? ""}" ,
                                target: item.target ?? "",
                                targetIf: '${item.target}',

                              //whatsappNumber: '201025619301',
                            );
                          } else if (item.video != null && item.video!.isNotEmpty) {
                            return ItemsVideo(
                              videoUrl:item.video?? '',
                                quantity: '${context.translate(LangKeys.quantity)}: ${item.quantity?? ""}',
                                price: '${context.translate(LangKeys.price)}: ${item.price?? ""}',
                                date: '${context.translate(LangKeys.data)}: ${item.createdAt?? ""}',
                                address: '${context.translate(LangKeys.address)}: ${item.city}',
                                listingId:"${context.translate(LangKeys.listingId)}: ${item.id?? ""}" ,
                                target: item.target ?? "",
                                targetIf: '${item.target}',
                              type:"${context.translate(LangKeys.type)}: ${item.id ?? ""}" ,

                            );
                          } else {
                            return ItemsPurchasing(
                                type:"${context.translate(LangKeys.type)}: ${item.id ?? ""}",
                                quantity: '${context.translate(LangKeys.quantity)}: ${item.quantity?? ""}',
                                price: '${context.translate(LangKeys.price)}: ${item.price?? ""}',
                                date: '${context.translate(LangKeys.data)}: ${item.createdAt?? ""}',
                                address: '${context.translate(LangKeys.address)}: ${item.city}',
                                listingId:"${context.translate(LangKeys.listingId)}: ${item.id?? ""}" ,
                                target: item.target ?? "",
                                targetIf: '${item.target}'
                            );
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
