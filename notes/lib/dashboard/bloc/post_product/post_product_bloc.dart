import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/dashboard/repository/post_productlist_repository.dart';

part 'post_product_event.dart';
part 'post_product_state.dart';

class PostProductBloc extends Bloc<PostProductEvent, PostProductState> {
  PostProductBloc() : super(PostProductInitial()) {
    on<OnPostProductEvent>(_onPostProductEvent);
  }
  PostProductRepository repomanager = PostProductRepository();

  FutureOr<void> _onPostProductEvent(
      OnPostProductEvent event, Emitter<PostProductState> emit) async {
    emit(PostProductloading());
    final name = event.name;
    final id = event.price;

    final repoResponse =
        await repomanager.hitProductPostapi(price: id, name: name);

    if (repoResponse == 1) {
      log('product post method success');
      emit(PostProductSuccess());
    } else {
      log('product post method failed');

      emit(PostProductFailed());
    }
  }
}
