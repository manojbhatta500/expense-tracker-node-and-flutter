import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/dashboard/repository/delete_productlist_repository.dart';

part 'delete_product_event.dart';
part 'delete_product_state.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  DeleteProductBloc() : super(DeleteProductInitial()) {
    on<OnDeleteButtonPressedEvent>(_onDeleteButtonPressedEvent);
  }

  DeleteProductRepository manager = DeleteProductRepository();

  FutureOr<void> _onDeleteButtonPressedEvent(OnDeleteButtonPressedEvent event,
      Emitter<DeleteProductState> emit) async {
    emit(DeleteProductLoading());

    final id = event.id;

    final repoResponse = await manager.hitProductdeleteApi(id: id);

    if (repoResponse == 1) {
      log('product post method success');
      emit(DeleteProductSuccess());
    } else {
      log('product post method failed');

      emit(DeleteProductFailed());
    }
  }
}
