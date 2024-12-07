import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/home_screen/data/model/purchase_store_request.dart';
import 'package:sell_your_crop/features/home_screen/data/repo/purchase_store_repo.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/purchase_store_state.dart';


class PurchaseStoreCubit extends Cubit<PurchaseStoreState> {
  final PurchaseStoreRepo _purchaseStoreRepo;
  TextEditingController genreController = TextEditingController();
  int? cityId;
  String? target;
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  PurchaseStoreCubit(this._purchaseStoreRepo) : super(const PurchaseStoreState.initial());

  void emitPurchaseStoreStates() async {
    emit(const PurchaseStoreState.loading());
    final response = await _purchaseStoreRepo.purchaseStore(
        PurchaseStoreRequest(
            genre: genreController.text,
            target:target.toString(),
            quantity: quantityController.text,
            price: priceController.text,
            phone: phoneController.text,
            cityId: cityId.toString(),
            type: 'purchase'
        ),
    );
    await response.when(
        success: (response) async{
      emit(PurchaseStoreState.success(message:response.msg!));
    }, failure: (error) {
      emit(PurchaseStoreState.error(error: error.apiErrorModel.msg));
    });
  }
}

