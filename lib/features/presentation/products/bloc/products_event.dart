part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetLink extends ProductsEvent {
  const GetLink({required this.link});
  final String link;
}

class GetProductsModel extends ProductsEvent {
  const GetProductsModel({required this.link, required this.customSeawrch});
  final String link;
  final bool customSeawrch;
}

class GetProduct extends ProductsEvent {
  const GetProduct({required this.searchModel, required this.customSearch});
  final HashMap searchModel;
  final bool customSearch;
}

class GoToDetails extends ProductsEvent {
  const GoToDetails({required this.product});
  final Product product;
}

class GetCart extends ProductsEvent {}

class GoToCart extends ProductsEvent {}

class RemoveCustomSearch extends ProductsEvent {}

class SearchProduct extends ProductsEvent {
  const SearchProduct({required this.text, required this.customSearch});
  final String text;
  final bool customSearch;
}
