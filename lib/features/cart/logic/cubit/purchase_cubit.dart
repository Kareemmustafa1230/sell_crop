import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/purchase_repo.dart';
import 'sell_purchase_state.dart';

class PurchaseCubit extends Cubit<SellAndPurchaseState> {
  final PurchaseRepo _purchaseRepo;

  PurchaseCubit(this._purchaseRepo) : super(const SellAndPurchaseState.initial());


    Future<void> emitPurchaseState() async {
      emit(const SellAndPurchaseState.loading());
      final response = await _purchaseRepo.purchase();
      await response.when(
        success: (response) async {
          emit(SellAndPurchaseState.success(searchResponse: response,));
        },
        failure: (error) {
          emit(SellAndPurchaseState.error(error: error.apiErrorModel.msg));
        },
      );
    }
  }


