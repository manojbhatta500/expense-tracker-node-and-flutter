part of 'patch_product_bloc.dart';

sealed class PatchProductState extends Equatable {
  const PatchProductState();

  @override
  List<Object> get props => [];
}

final class PatchProductInitial extends PatchProductState {}

final class PatchProductLoading extends PatchProductState {}

final class PatchProductSuccessState extends PatchProductState {}

final class PatchProductFailedState extends PatchProductState {}
