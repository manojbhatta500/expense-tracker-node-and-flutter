part of 'get_product_list_bloc.dart';

sealed class GetProductListState extends Equatable {
  const GetProductListState();

  @override
  List<Object> get props => [];
}

final class GetProductListInitial extends GetProductListState {}

final class GetProductListLoading extends GetProductListState {}

final class GetProductListSuccess extends GetProductListState {
  final List<ProductClass> data;
  GetProductListSuccess({required this.data});
}

final class GetProductListFailed extends GetProductListState {}
