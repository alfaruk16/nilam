part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  const CategoriesState(
      {this.loading = false,
      this.categories = const [],
      this.cartResponse = const CartResponse(),
      this.link = ""});

  final bool loading;
  final List<CategoryResponse> categories;
  final CartResponse cartResponse;
  final String link;

  CategoriesState copyWith(
      {bool? loading,
      List<CategoryResponse>? categories,
      CartResponse? cartResponse,
      String? link}) {
    return CategoriesState(
        loading: loading ?? this.loading,
        categories: categories ?? this.categories,
        cartResponse: cartResponse ?? this.cartResponse,
        link: link ?? this.link);
  }

  @override
  List<Object> get props => [loading, categories, cartResponse, link];
}

class OnBoardInitial extends CategoriesState {}
