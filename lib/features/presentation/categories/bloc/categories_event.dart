part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategories extends CategoriesEvent {}

class GoToSearch extends CategoriesEvent {
  const GoToSearch({required this.link});
  final String link;
}

class GetCart extends CategoriesEvent {}

class GoToCart extends CategoriesEvent {}

class SearchProduct extends CategoriesEvent {
  const SearchProduct({required this.text, required this.customSearch});
  final String text;
  final bool customSearch;
}
