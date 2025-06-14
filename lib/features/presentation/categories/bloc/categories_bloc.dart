import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/domain/entities/cart_response.dart';
import 'package:nilam/features/domain/entities/category_response.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/cart/view/cart_screen.dart';
import 'package:nilam/features/presentation/products/view/products_screen.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(this._iFlutterNavigator, this._localStorageRepo)
      : super(const CategoriesState()) {
    on<GetCategories>(_getCategories);
    on<GoToSearch>(_goToSearch);
    on<GetCart>(_getCart);
    on<GoToCart>(_goToCart);

    add(GetCart());
    add(GetCategories());
  }

  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  Future<FutureOr<void>> _getCategories(
      GetCategories event, Emitter<CategoriesState> emit) async {
    final categoryLink = _localStorageRepo.read(key: categoryLocalKeyDB);
    if (categoryLink != null) {
      final categories = await _localStorageRepo
          .readModelForList<List<CategoryResponse>, CategoryResponse>(
              key: categoryLink);
      emit(state.copyWith(categories: categories));
    }
  }

  FutureOr<void> _goToSearch(GoToSearch event, Emitter<CategoriesState> emit) {
    _iFlutterNavigator.push(ProductsScreen.route(link: event.link));
  }

  Future<FutureOr<void>> _getCart(
      GetCart event, Emitter<CategoriesState> emit) async {
    final cart = await _localStorageRepo.readModel<CartResponse>(key: cartDB);
    if (cart != null) {
      emit(state.copyWith(cartResponse: cart));
    }
  }

  FutureOr<void> _goToCart(GoToCart event, Emitter<CategoriesState> emit) {
    _iFlutterNavigator
        .push(CartScreen.route(isEmi: false))
        .then((value) => add(GetCart()));
  }
}
