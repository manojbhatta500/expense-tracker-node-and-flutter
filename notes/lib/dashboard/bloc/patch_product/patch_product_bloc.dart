import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/dashboard/repository/patch_productlist_repository.dart';

part 'patch_product_event.dart';
part 'patch_product_state.dart';

class PatchProductBloc extends Bloc<PatchProductEvent, PatchProductState> {
  PatchProductBloc() : super(PatchProductInitial()) {
    on<OnPatchProductEvent>(_onPatchProductEvent);
  }
  PatchProductListRepository manager = PatchProductListRepository();

  FutureOr<void> _onPatchProductEvent(
      OnPatchProductEvent event, Emitter<PatchProductState> emit) async {
    emit(PatchProductLoading());
    final id = event.id;
    final name = event.name;
    final price = event.price;

    final reporesponse =
        await manager.hitProductpatchapi(id: id, name: name, price: price);
    if (reporesponse == 1) {
      emit(PatchProductSuccessState());
    } else {
      emit(PatchProductFailedState());
    }
  }
}
