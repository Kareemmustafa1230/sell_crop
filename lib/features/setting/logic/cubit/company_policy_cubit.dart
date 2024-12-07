import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/data/repo/copmany_policy_repo.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/company_policy_state.dart';


class CompanyPolicyCubit extends Cubit<CompanyPolicyState> {
  final CompanyPolicyRepo _companyPolicyRepo;

  CompanyPolicyCubit(this._companyPolicyRepo) : super(const CompanyPolicyState.initial());

  void emitCompanyPolicyStates() async {
    emit(const CompanyPolicyState.loading());
    final response = await _companyPolicyRepo.companyPolicy();
    await response.when(
        success: (response) async{
      emit(CompanyPolicyState.success(companyPolicyResponse: response));
    }, failure: (error) {
      emit(CompanyPolicyState.error(error: error.apiErrorModel.msg));
    });
  }
}

