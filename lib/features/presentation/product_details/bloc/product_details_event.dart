part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetProduct extends ProductDetailsEvent {
  const GetProduct({required this.product});
  final Product product;
}

class GetRelatedProduct extends ProductDetailsEvent {
  const GetRelatedProduct({required this.id});
  final int id;
}

class BuyNow extends ProductDetailsEvent {}

class AddToCart extends ProductDetailsEvent {
  const AddToCart({required this.product});
  final ProductDetails product;
}

class GetCart extends ProductDetailsEvent {}

class GetCurrentCart extends ProductDetailsEvent {}

class GoToCart extends ProductDetailsEvent {}

class GoToBid extends ProductDetailsEvent {}

class IncreaseItem extends ProductDetailsEvent {}

class DecreaseItem extends ProductDetailsEvent {}

class IsEmi extends ProductDetailsEvent {
  const IsEmi({required this.isEmi});
  final bool isEmi;
}

class GoToBargain extends ProductDetailsEvent {}

class GoToSellerInfo extends ProductDetailsEvent {}
