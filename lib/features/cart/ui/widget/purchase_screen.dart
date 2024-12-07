import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_your_crop/core/helpers/animate_do.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/purchase_cubit.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/sell_purchase_state.dart';
import 'package:sell_your_crop/features/search/ui/widget/items_purchasing.dart';
import '../../../../core/theme/Color/colors.dart';
import '../../../../core/theme/text_style/text_style.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseCubit, SellAndPurchaseState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.translate(LangKeys.cropPurchaseing),
              style: TextStyleApp.font22black00Weight500.copyWith(
                  fontWeight: FontWeight.w600, color: ColorApp.black00),),
            elevation: 0,
            centerTitle: true,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: ColorApp.black00),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )
            ),
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                   SizedBox(height: 5.h),
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
                          return CustomFadeInDown(
                              duration: 1500,
                            child:ItemsPurchasing(
                            type: "${context.translate(LangKeys.type)}: ${item.id ?? ""}",
                            quantity: '${context.translate(LangKeys.quantity)}: ${item.quantity ?? ""}',
                            price: '${context.translate(LangKeys.price)}: ${item.price ?? ""}',
                            date: '${context.translate(LangKeys.data)}: ${item.createdAt ?? ""}',
                            address: '${context.translate(LangKeys.address)}: ${item.city ?? ""}',
                            listingId: "${context.translate(LangKeys.listingId)}: ${item.id ?? ""}",
                            target: item.target ?? "",
                            targetIf: item.target ?? "",
                          ),
                          );
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
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:sell_your_crop/features/cart/logic/cubit/purchase_cubit.dart';
// import 'package:sell_your_crop/features/cart/logic/cubit/sell_purchase_state.dart';
// import 'package:sell_your_crop/features/search/ui/widget/items_purchasing.dart';
// import '../../../../core/theme/Color/colors.dart';
// import '../../../../core/theme/text_style/text_style.dart';
//
// class PurchaseScreen extends StatefulWidget {
//   const PurchaseScreen({super.key});
//
//   @override
//   State<PurchaseScreen> createState() => _PurchaseScreenState();
// }
//
// class _PurchaseScreenState extends State<PurchaseScreen> {
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         context.read<PurchaseCubit>().emitPurchaseState();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PurchaseCubit, PurchaseState>(
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Crop Purchaseing',
//               style: TextStyleApp.font22black00Weight500.copyWith(
//                   fontWeight: FontWeight.w600, color: ColorApp.black00),),
//             elevation: 0,
//             centerTitle: true,
//             clipBehavior: Clip.antiAlias,
//             shape: const RoundedRectangleBorder(
//                 side: BorderSide(color: ColorApp.black00),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(15),
//                   bottomRight: Radius.circular(15),
//                 )
//             ),
//             backgroundColor: Colors.white,
//           ),
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: [
//                   SizedBox(height: 10.h),
//                   if (state is Loading)
//                     const Expanded(
//                       child: Center(
//                         child: SpinKitFadingCircle(color: ColorApp.black00),
//                       ),
//                     ),
//                   if (state is Success)
//                     Expanded(
//                       child: ListView.builder(
//                         controller: _scrollController,
//                         itemCount: state.searchResponse.data?.length ?? 0,
//                         itemBuilder: (context, index) {
//                           final item = state.searchResponse.data![index];
//                           return ItemsPurchasing(
//                             type: "type: ${item.id ?? ""}",
//                             quantity: 'Quantity: ${item.quantity ?? ""}',
//                             price: 'Price: ${item.price ?? ""}',
//                             date: 'Date: ${item.createdAt ?? ""}',
//                             address: 'Address: ${item.city ?? ""}',
//                             listingId: "ListingId: ${item.id ?? ""}",
//                             target: item.target ?? "",
//                             targetIf: item.target ?? "",
//                           );
//                         },
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

