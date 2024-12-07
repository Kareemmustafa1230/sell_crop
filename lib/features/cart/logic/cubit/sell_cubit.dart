import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/cart/data/repo/sell_repo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sell_purchase_state.dart';

class SellCubit extends Cubit<SellAndPurchaseState> {
  final SellRepo _sellRepo;

  SellCubit(this._sellRepo) : super(const SellAndPurchaseState.initial());

    Future<void> emitSellState() async {
      emit(const SellAndPurchaseState.loading());
      final response = await _sellRepo.sell();
      await response.when(
        success: (response) async {
          emit(SellAndPurchaseState.success(searchResponse: response,));
        },
        failure: (error) {
          emit(SellAndPurchaseState.error(error: error.apiErrorModel.msg));
        },
      );
    }

  void launchWhatsApp()async{
    String phoneNumber = '201025619301';
    await launch('https://wa.me/$phoneNumber?text=مرحبا');
  }
  }


