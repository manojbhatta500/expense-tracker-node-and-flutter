part of 'patch_product_bloc.dart';

sealed class PatchProductEvent extends Equatable {
  const PatchProductEvent();

  @override
  List<Object> get props => [];
}

final class OnPatchProductEvent extends PatchProductEvent {
  final String id;
  final String name;
  final int price;
  OnPatchProductEvent(
      {required this.id, required this.name, required this.price});
}
