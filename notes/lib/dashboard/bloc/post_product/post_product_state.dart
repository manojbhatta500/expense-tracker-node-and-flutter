part of 'post_product_bloc.dart';

sealed class PostProductState extends Equatable {
  const PostProductState();

  @override
  List<Object> get props => [];
}

final class PostProductInitial extends PostProductState {}

final class PostProductSuccess extends PostProductState {}

final class PostProductloading extends PostProductState {}

final class PostProductFailed extends PostProductState {}
