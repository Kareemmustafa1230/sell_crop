import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/data/repo/partner_repo.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/partner_state.dart';


class PartnerCubit extends Cubit<PartnerState> {
  final PartnerRepo _partnerRepo;

  PartnerCubit(this._partnerRepo) : super(const PartnerState.initial());

  void emitPartnerStates() async {
    emit(const PartnerState.loading());
    final response = await _partnerRepo.partners();
    await response.when(
        success: (response) async{
      emit(PartnerState.success(partnerResponse: response));
    }, failure: (error) {
      emit(PartnerState.error(error: error.apiErrorModel.msg));
    });
  }
}

