import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/snackbar/show_snackbar.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/data/model/bargain_model.dart';
import 'package:nilam/features/domain/entities/bargain_response.dart';
import 'package:nilam/features/domain/entities/bargain_info.dart';
import 'package:nilam/features/domain/entities/cancel_bargain_response.dart';
import 'package:nilam/features/domain/entities/cart_response.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/presentation/cart/view/cart_screen.dart';

part 'bargain_event.dart';
part 'bargain_state.dart';

class BargainBloc extends Bloc<BargainEvent, BargainState> {
  BargainBloc(this._apiRepo, this._iFlutterNavigator)
      : super(const BargainState()) {
    on<GetProduct>(_getProduct);
    on<IncreaseItem>(_increaseItem);
    on<DecreaseItem>(_decreaseItem);
    on<BargainChanged>(_bargainChanged);
    on<GetBargainInfo>(_getBargainInfo);
    on<ApplyBargain>(_bargain);
    on<CancelBargain>(_cancelBargain);
    on<ScrollToBottom>(_scrollToBottom);
    on<BuyNow>(_buyNow);
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;

  Future<FutureOr<void>> _getProduct(
      GetProduct event, Emitter<BargainState> emit) async {
    emit(state.copyWith(productDetails: event.product, isEmi: event.isEmi));

    final productDetails = await _apiRepo.post<ProductDetails>(
        endpoint: getProductDetails(event.product.id!, event.product.slug!));

    if (productDetails != null) {
      emit(state.copyWith(
          productDetails: productDetails,
          quantity: productDetails.cartQuantity!.toInt() != 0
              ? productDetails.cartQuantity!.toInt()
              : 1));

      add(GetBargainInfo(id: productDetails.id.toString()));
    }
  }

  FutureOr<void> _increaseItem(IncreaseItem event, Emitter<BargainState> emit) {
    if (state.productDetails.stockQuantity! > state.quantity) {
      emit(state.copyWith(quantity: state.quantity + 1));
    } else {
      ShowSnackBar(
          message: "Out of Stock", navigator: _iFlutterNavigator, error: true);
    }
  }

  FutureOr<void> _decreaseItem(DecreaseItem event, Emitter<BargainState> emit) {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  FutureOr<void> _bargainChanged(
      BargainChanged event, Emitter<BargainState> emit) {
    emit(state.copyWith(bargainAmount: event.text));
  }

  Future<FutureOr<void>> _getBargainInfo(
      GetBargainInfo event, Emitter<BargainState> emit) async {
    final bargainInfo = await _apiRepo.post<BargainInfoResponse>(
        endpoint: getBargainInfoByItemId(event.id));
    if (bargainInfo != null) {
      emit(state.copyWith(bargainInfoResponse: bargainInfo));
      if (event.controller != null) {
        add(ScrollToBottom(controller: event.controller!));
        emit(state.copyWith(loading: true));
        await Future.delayed(const Duration(seconds: 3));
        emit(state.copyWith(loading: false));
        add(ScrollToBottom(controller: event.controller!));
      }
    }
  }

  Future<FutureOr<void>> _bargain(
      ApplyBargain event, Emitter<BargainState> emit) async {
    if (state.bargainAmount.isNotEmpty) {
      if (!state.loading) {
        final bargain = await _apiRepo.post<BargainResponse>(
            endpoint: sendBargainPrice,
            body: BargainModel(
                itemId: state.productDetails.id!,
                amount: state.bargainAmount,
                quantity: state.quantity,
                bargainId: 0));
        if (bargain != null) {
          if (bargain.responseCode == "200") {
            event.bargainController.clear();
            emit(state.copyWith(bargainAmount: ""));
            add(GetBargainInfo(
                id: state.productDetails.id.toString(),
                controller: event.controller));
          } else {
            ShowSnackBar(
                message: bargain.responseMessage ?? "",
                navigator: _iFlutterNavigator,
                error: true);
          }
        }
      }
    }
  }

  Future<FutureOr<void>> _cancelBargain(
      CancelBargain event, Emitter<BargainState> emit) async {
    if (state.bargainInfoResponse.bargain != null) {
      final cancel = await _apiRepo.post<CancelBargainResponse>(
          endpoint:
              cancelBargain(state.bargainInfoResponse.bargain!.id.toString()));
      if (cancel != null) {
        add(GetBargainInfo(id: state.productDetails.id.toString()));
      }
    }
  }

  Future<FutureOr<void>> _scrollToBottom(
      ScrollToBottom event, Emitter<BargainState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100));
    event.controller.animateTo(event.controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
  }

  FutureOr<void> _buyNow(BuyNow event, Emitter<BargainState> emit) {
    final item = state.productDetails;
    _iFlutterNavigator.push(CartScreen.route(
        buyNowItem: CartItem(
            itemId: item.id,
            measurementName: item.measurementName,
            cartQuantity: state.quantity,
            stockQuantity: item.stockQuantity,
            imageUrl:
                "${item.documents![0].localPath!}/${item.documents![0].uuid!}",
            itemName: item.itemName,
            isSelected: false,
            salesPrice: item.salesPrice,
            discountedPrice: event.amount,
            sellerId: item.sellerId,
            slug: item.slug),
        isEmi: state.isEmi));
  }
}
