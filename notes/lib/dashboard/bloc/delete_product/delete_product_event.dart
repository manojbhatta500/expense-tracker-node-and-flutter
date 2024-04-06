part of 'delete_product_bloc.dart';

sealed class DeleteProductEvent extends Equatable {
  const DeleteProductEvent();

  @override
  List<Object> get props => [];
}

final class OnDeleteButtonPressedEvent extends DeleteProductEvent {
  final String id;
  OnDeleteButtonPressedEvent({required this.id});
}
