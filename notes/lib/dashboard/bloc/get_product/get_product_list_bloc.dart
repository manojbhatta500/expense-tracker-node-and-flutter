import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/dashboard/model/product.dart';
import 'package:notes/dashboard/repository/get_productlist_repository.dart';

part 'get_product_list_event.dart';
part 'get_product_list_state.dart';

class GetProductListBloc
    extends Bloc<GetProductListEvent, GetProductListState> {
  GetProductListBloc() : super(GetProductListInitial()) {
    on<FetchingListevent>(_fetchingListEvent);
  }
  GetProductListRepository manager = GetProductListRepository();

  FutureOr<void> _fetchingListEvent(
      FetchingListevent event, Emitter<GetProductListState> emit) async {
    emit(GetProductListLoading());

    final repoResponse = await manager.hitProductListapi();

    repoResponse.fold((l) {
      log('we have get method failed ');

      emit(GetProductListFailed());
    }, (r) {
      log('we have get method success ');
      emit(GetProductListSuccess(data: r));
    });
  }
}
