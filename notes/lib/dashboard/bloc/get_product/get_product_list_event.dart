part of 'get_product_list_bloc.dart';

sealed class GetProductListEvent extends Equatable {
  const GetProductListEvent();

  @override
  List<Object> get props => [];
}

final class FetchingListevent extends GetProductListEvent {}
