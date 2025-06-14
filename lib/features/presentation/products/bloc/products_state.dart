part of 'products_bloc.dart';

class ProductsState extends Equatable {
  const ProductsState(
      {this.loading = false,
      this.customSearchResponse = const SearchResponse(),
      this.searchResponse = const SearchResponse(),
      this.cartResponse = const CartResponse(),
      this.link = ""});

  final bool loading;
  final SearchResponse customSearchResponse;
  final SearchResponse searchResponse;
  final CartResponse cartResponse;
  final String link;

  ProductsState copyWith(
      {bool? loading,
      SearchResponse? customSearchResponse,
      SearchResponse? searchResponse,
      CartResponse? cartResponse,
      String? link}) {
    return ProductsState(
        loading: loading ?? this.loading,
        customSearchResponse: customSearchResponse ?? this.customSearchResponse,
        searchResponse: searchResponse ?? this.searchResponse,
        cartResponse: cartResponse ?? this.cartResponse,
        link: link ?? this.link);
  }

  @override
  List<Object> get props =>
      [loading, searchResponse, customSearchResponse, cartResponse, link];
}

class OnBoardInitial extends ProductsState {}
