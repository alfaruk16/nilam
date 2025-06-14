part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  const ProductDetailsState(
      {this.product = const Product(),
      this.productDetails = const ProductDetails(),
      this.relatedProduct = const [],
      this.addLoading = false,
      this.cartResponse = const CartResponse(),
      this.quantity = 1,
      this.isEmi = false});

  final Product product;
  final ProductDetails productDetails;
  final List<Product> relatedProduct;
  final bool addLoading;
  final CartResponse cartResponse;
  final int quantity;
  final bool isEmi;

  ProductDetailsState copyWith(
      {Product? product,
      ProductDetails? productDetails,
      List<Product>? relatedProduct,
      bool? addLoading,
      CartResponse? cartResponse,
      int? quantity,
      bool? isEmi}) {
    return ProductDetailsState(
        product: product ?? this.product,
        productDetails: productDetails ?? this.productDetails,
        relatedProduct: relatedProduct ?? this.relatedProduct,
        addLoading: addLoading ?? this.addLoading,
        cartResponse: cartResponse ?? this.cartResponse,
        quantity: quantity ?? this.quantity,
        isEmi: isEmi ?? this.isEmi);
  }

  @override
  List<Object> get props => [
        product,
        productDetails,
        relatedProduct,
        addLoading,
        cartResponse,
        quantity,
        isEmi
      ];
}

class OnBoardInitial extends ProductDetailsState {}
