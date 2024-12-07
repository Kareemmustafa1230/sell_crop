import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/search_repo.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;

  SearchCubit(this._searchRepo) : super(const SearchState.initial());

  TextEditingController searchController = TextEditingController();

    Future<void> emitSearchState({required String searchQuery}) async {
      emit(const SearchState.loading());
      final loginResponse = await _searchRepo.search(
          searchQuery = searchController.text
      );
      await loginResponse.when(
        success: (response) async {
          emit(SearchState.success(searchResponse: response,));
        },
        failure: (error) {
          emit(SearchState.error(error: error.apiErrorModel.msg));
        },
      );
    }
  }


