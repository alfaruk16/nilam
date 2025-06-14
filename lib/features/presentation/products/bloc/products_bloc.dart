import 'dart:async';
import 'dart:collection';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/domain/entities/cart_response.dart';
import 'package:nilam/features/domain/entities/product_response.dart';
import 'package:nilam/features/domain/entities/search_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/cart/view/cart_screen.dart';
import 'package:nilam/features/presentation/product_details/view/product_details_screen.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this._apiRepo, this._iFlutterNavigator, this._localStorageRepo)
      : super(const ProductsState()) {
    on<GetProductsModel>(_getProductsModel);
    on<GetLink>(_getLink);
    on<GetProduct>(_getProduct);
    on<GoToDetails>(_goToDetails);
    on<GetCart>(_getCart);
    on<GoToCart>(_goToCart);
    on<SearchProduct>(_searchProduct);
    on<RemoveCustomSearch>(_removeCustomSearch);

    add(GetCart());
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  FutureOr<void> _getLink(GetLink event, Emitter<ProductsState> emit) {
    emit(state.copyWith(link: event.link));
    add(GetProductsModel(link: event.link, customSeawrch: false));
  }

  FutureOr<void> _getProductsModel(
      GetProductsModel event, Emitter<ProductsState> emit) {
    if (event.link.isNotEmpty) {
      final link = event.link.split("?");
      final items = link[1].split("&");

      HashMap<String, dynamic> map = HashMap();

      for (int i = 0; i < items.length; i++) {
        final data = items[i].split("=");
        if (data[0] == Search.Category.name) {
          map[Search.Category.name] = map[Search.Category.name] != null
              ? map[Search.Category.name].add(int.parse(data[1]))
              : [int.parse(data[1])];
        } else if (data[0] == Search.SaleType.name) {
          map[Search.SaleType.name] = map[Search.SaleType.name] != null
              ? map[Search.SaleType.name].add(data[1])
              : [data[1]];
        } else if (data[0] == Search.Condition.name) {
          map[Search.Condition.name] = map[Search.Condition.name] != null
              ? map[Search.Condition.name].add(data[1])
              : [data[1]];
        } else if (data[0] == Search.StockType.name) {
          map[Search.StockType.name] = map[Search.StockType.name] != null
              ? map[Search.StockType.name].add(data[1])
              : [data[1]];
        } else if (data[0] == Search.ItemGroup.name) {
          map[Search.ItemGroup.name] = map[Search.ItemGroup.name] != null
              ? map[Search.ItemGroup.name].add(data[1])
              : [data[1]];
        } else if (data[0] == Search.Attributes.name) {
          map[Search.Attributes.name] = map[Search.Attributes.name] != null
              ? map[Search.Attributes.name].add(int.parse(data[1]))
              : [int.parse(data[1])];
        } else if (data[0] == Search.SortBy.name) {
          map[Search.SortBy.name] = data[1];
        } else if (data[0] == Search.Page.name) {
          map[Search.Page.name] = int.parse(data[1]);
        } else if (data[0] == Search.Length.name) {
          map[Search.Length.name] = int.parse(data[1]);
        } else if (data[0] == Search.ParentCategoryId.name) {
          map[Search.ParentCategoryId.name] = data[1];
        } else if (data[0] == Search.Min.name) {
          map[Search.Min.name] = int.parse(data[1]);
        } else if (data[0] == Search.Max.name) {
          map[Search.Max.name] = int.parse(data[1]);
        } else if (data[0] == Search.Keyword.name) {
          map[Search.Keyword.name] = data[1];
        } else if (data[0] == Search.Type.name) {
          map[Search.Type.name] = data[1];
        } else if (data[0] == Search.ownerId.name) {
          map[Search.ownerId.name] = data[1];
        } else {
          map[data[0]] = data[1];
        }
      }
      add(GetProduct(searchModel: map, customSearch: event.customSeawrch));
    }
  }

  Future<FutureOr<void>> _getProduct(
      GetProduct event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(loading: true));
    final products = await _apiRepo.post<SearchResponse>(
        endpoint: getProducts, body: event.searchModel);
    emit(state.copyWith(loading: false));
    if (products != null) {
      if (event.customSearch) {
        emit(state.copyWith(customSearchResponse: products));
      } else {
        emit(state.copyWith(searchResponse: products));
      }
    }
  }

  FutureOr<void> _goToDetails(GoToDetails event, Emitter<ProductsState> emit) {
    _iFlutterNavigator.push(ProductDetailsScreen.route(product: event.product));
  }

  Future<FutureOr<void>> _getCart(
      GetCart event, Emitter<ProductsState> emit) async {
    final cart = await _localStorageRepo.readModel<CartResponse>(key: cartDB);
    if (cart != null) {
      emit(state.copyWith(cartResponse: cart));
    }
  }

  FutureOr<void> _goToCart(GoToCart event, Emitter<ProductsState> emit) {
    _iFlutterNavigator
        .push(CartScreen.route(isEmi: false))
        .then((value) => add(GetCart()));
  }

  Future<FutureOr<void>> _searchProduct(
      SearchProduct event, Emitter<ProductsState> emit) async {
    EasyDebounce.debounce('de-bouncer', const Duration(milliseconds: 500), () {
      if (event.text.isNotEmpty) {
        add(GetProductsModel(
            link: "product/search?Keyword=${event.text}",
            customSeawrch: event.customSearch));
      } else {
        add(RemoveCustomSearch());
      }
    });
  }

  FutureOr<void> _removeCustomSearch(
      RemoveCustomSearch event, Emitter<ProductsState> emit) {
    emit(state.copyWith(customSearchResponse: const SearchResponse()));
  }
}
