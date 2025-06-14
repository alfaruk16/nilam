import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/snackbar/show_snackbar.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/data/model/add_cart_model.dart';
import 'package:nilam/features/domain/entities/add_to_cart_response.dart';
import 'package:nilam/features/domain/entities/cart_response.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';
import 'package:nilam/features/domain/entities/product_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/domain/usecases/local_data.dart';
import 'package:nilam/features/presentation/bargain/view/bargain_screen.dart';
import 'package:nilam/features/presentation/auction/view/auction_screen.dart';
import 'package:nilam/features/presentation/cart/view/cart_screen.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(
      this._apiRepo, this._iFlutterNavigator, this._localStorageRepo)
      : super(const ProductDetailsState()) {
    on<GetProduct>(_getProduct);
    on<GetRelatedProduct>(_getRelatedProduct);
    on<BuyNow>(_buyNow);
    on<AddToCart>(_addToCart);
    on<GetCart>(_getCart);
    on<GetCurrentCart>(_getCurrentCart);
    on<GoToCart>(_goToCart);
    on<IncreaseItem>(_inCreaseItem);
    on<DecreaseItem>(_decreaseItem);
    on<IsEmi>(_isEmi);
    on<GoToBargain>(_goToBargain);
    on<GoToBid>(_goToBid);
    on<GoToSellerInfo>(_goToSellerInfo);

    add(GetCart());
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  Future<FutureOr<void>> _getProduct(
      GetProduct event, Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(product: event.product));

    final productDetails = await _apiRepo.post<ProductDetails>(
        endpoint: getProductDetails(event.product.id!, event.product.slug!));

    if (productDetails != null) {
      emit(state.copyWith(
          productDetails: productDetails,
          quantity: productDetails.cartQuantity!.toInt() != 0
              ? productDetails.cartQuantity!.toInt()
              : 1));
      add(GetRelatedProduct(id: event.product.id!));
    }
  }

  Future<FutureOr<void>> _getRelatedProduct(
      GetRelatedProduct event, Emitter<ProductDetailsState> emit) async {
    final products = await _apiRepo.postForList<List<Product>, Product>(
        endpoint: getRelatedProducts(event.id));
    emit(state.copyWith(relatedProduct: products));
  }

  Future<FutureOr<void>> _buyNow(
      BuyNow event, Emitter<ProductDetailsState> emit) async {
    if (await LocalData.isVerifiedUser(_iFlutterNavigator, callback: () {
      add(GetCurrentCart());
    })) {
      final item = state.productDetails;
      _iFlutterNavigator.push(CartScreen.route(
          buyNowItem: CartItem(
              itemId: item.id,
              measurementName: item.measurementName,
              cartQuantity: item.cartQuantity != 0 ? item.cartQuantity : 1,
              stockQuantity: item.stockQuantity,
              imageUrl:
                  "${item.documents![0].localPath!}/${item.documents![0].uuid!}",
              itemName: item.itemName,
              isSelected: false,
              salesPrice: item.salesPrice,
              discountedPrice: item.discountedPrice,
              sellerId: item.sellerId,
              slug: item.slug),
          isEmi: state.isEmi));
    }
  }

  Future<FutureOr<void>> _addToCart(
      AddToCart event, Emitter<ProductDetailsState> emit) async {
    if (await LocalData.isVerifiedUser(_iFlutterNavigator, callback: () {
      add(GetCurrentCart());
    })) {
      if (!state.addLoading) {
        emit(state.copyWith(addLoading: true));
        final addCart = await _apiRepo.post<AddToCarResponse>(
            endpoint: addToCart,
            body: AddCartModel(
              itemId: event.product.id,
              quantity: state.quantity,
              stock: event.product.stockQuantity,
            ));
        if (addCart != null) {
          ShowSnackBar(
              message: addCart.items!.responseMessage!,
              navigator: _iFlutterNavigator);

          add(GetCurrentCart());
        }

        emit(state.copyWith(addLoading: false));
      }
    }
  }

  Future<FutureOr<void>> _getCart(
      GetCart event, Emitter<ProductDetailsState> emit) async {
    final cart = await _localStorageRepo.readModel<CartResponse>(key: cartDB);
    if (cart != null) {
      emit(state.copyWith(cartResponse: cart));
    }
  }

  Future<FutureOr<void>> _getCurrentCart(
      GetCurrentCart event, Emitter<ProductDetailsState> emit) async {
    final cart = await _apiRepo.post<CartResponse>(endpoint: getAllCarts);
    if (cart != null) {
      emit(state.copyWith(cartResponse: cart));
      await _localStorageRepo.writeModel(key: cartDB, value: cart);
      add(GetCart());
    }
  }

  FutureOr<void> _goToCart(GoToCart event, Emitter<ProductDetailsState> emit) {
    _iFlutterNavigator
        .push(CartScreen.route(isEmi: state.isEmi))
        .then((value) => add(GetCart()));
  }

  FutureOr<void> _inCreaseItem(
      IncreaseItem event, Emitter<ProductDetailsState> emit) {
    if (state.productDetails.stockQuantity! > state.quantity) {
      emit(state.copyWith(quantity: state.quantity + 1));
    } else {
      ShowSnackBar(
          message: "Out of Stock", navigator: _iFlutterNavigator, error: true);
    }
  }

  FutureOr<void> _decreaseItem(
      DecreaseItem event, Emitter<ProductDetailsState> emit) {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  FutureOr<void> _isEmi(IsEmi event, Emitter<ProductDetailsState> emit) {
    emit(state.copyWith(isEmi: event.isEmi));
  }

  Future<FutureOr<void>> _goToBargain(
      GoToBargain event, Emitter<ProductDetailsState> emit) async {
    if (await LocalData.isVerifiedUser(_iFlutterNavigator, callback: () {
      add(GetCurrentCart());
    })) {
      _iFlutterNavigator.push(BargainScreen.route(
          product: state.productDetails, isEmi: state.isEmi));
    }
  }

  FutureOr<void> _goToSellerInfo(
      GoToSellerInfo event, Emitter<ProductDetailsState> emit) {}

  Future<FutureOr<void>> _goToBid(
      GoToBid event, Emitter<ProductDetailsState> emit) async {
    if (await LocalData.isVerifiedUser(_iFlutterNavigator, callback: () {})) {
      _iFlutterNavigator.push(AuctionScreen.route(
          product: state.productDetails, isEmi: state.isEmi));
    }
  }
}
