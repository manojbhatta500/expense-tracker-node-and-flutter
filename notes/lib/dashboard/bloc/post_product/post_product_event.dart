part of 'post_product_bloc.dart';

sealed class PostProductEvent extends Equatable {
  const PostProductEvent();

  @override
  List<Object> get props => [];
}

final class OnPostProductEvent extends PostProductEvent {
  final String name;
  final int price;
  OnPostProductEvent({required this.name, required this.price});
}
