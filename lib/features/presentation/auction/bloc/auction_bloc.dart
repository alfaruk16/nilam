import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/snackbar/show_snackbar.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/data/model/auto_bid_model.dart';
import 'package:nilam/features/data/model/bid_model.dart';
import 'package:nilam/features/domain/entities/bid_info_response.dart';
import 'package:nilam/features/domain/entities/cart_response.dart';
import 'package:nilam/features/domain/entities/nilam_response.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';
import 'package:nilam/features/domain/entities/profile.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/usecases/local_data.dart';
import 'package:nilam/features/presentation/auction/widgets/show_auto_bid.dart';
import 'package:nilam/features/presentation/cart/view/cart_screen.dart';

part 'auction_event.dart';
part 'auction_state.dart';

class AuctionBloc extends Bloc<AuctionEvent, AuctionState> {
  AuctionBloc(this._apiRepo, this._iFlutterNavigator)
      : super(const AuctionState()) {
    on<GetProduct>(_getProduct);
    on<BidChanged>(_bidChanged);
    on<GetBiddingInfo>(_getBidInfo);
    on<ApplyBid>(_bid);
    on<ScrollToTop>(_scrollToTop);
    on<BuyNow>(_buyNow);
    on<ShowAutoBid>(_showAutoBid);
    on<AutoBid>(_autoBid);
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;

  Future<FutureOr<void>> _getProduct(
      GetProduct event, Emitter<AuctionState> emit) async {
    emit(state.copyWith(
        productDetails: event.product,
        isEmi: event.isEmi,
        profile: await LocalData.getProfile()));

    final productDetails = await _apiRepo.post<ProductDetails>(
        endpoint: getProductDetails(event.product.id!, event.product.slug!));

    if (productDetails != null) {
      emit(state.copyWith(
          productDetails: productDetails,
          quantity: productDetails.cartQuantity!.toInt() != 0
              ? productDetails.cartQuantity!.toInt()
              : 1));

      add(GetBiddingInfo(id: productDetails.auctionId.toString()));
    }
  }

  FutureOr<void> _bidChanged(BidChanged event, Emitter<AuctionState> emit) {
    emit(state.copyWith(amount: event.text));
  }

  Future<FutureOr<void>> _getBidInfo(
      GetBiddingInfo event, Emitter<AuctionState> emit) async {
    final bidInfo =
        await _apiRepo.postForList<List<BidInfoResponse>, BidInfoResponse>(
            endpoint: getAllBid(event.id));
    if (bidInfo != null) {
      emit(state.copyWith(bidResponse: bidInfo));
      if (event.controller != null) {
        add(ScrollToTop(controller: event.controller!));
      }
    }
  }

  Future<FutureOr<void>> _bid(
      ApplyBid event, Emitter<AuctionState> emit) async {
    if (state.amount.isNotEmpty) {
      if (!state.loading) {
        emit(state.copyWith(loading: true));
        final bid = await _apiRepo.post<NilamResponse>(
            endpoint: placeBid,
            body: BidModel(
                auctionId: state.productDetails.auctionId!,
                bidAmount: state.amount));
        emit(state.copyWith(loading: false));
        if (bid != null) {
          if (bid.responseCode == "200") {
            event.bidController.clear();
            emit(state.copyWith(amount: ""));
            add(GetBiddingInfo(
                id: state.productDetails.auctionId.toString(),
                controller: event.controller));
          } else {
            ShowSnackBar(
                message: bid.responseMessage ?? "",
                navigator: _iFlutterNavigator,
                error: true);
          }
        }
      }
    } else {
      ShowSnackBar(
          message: "Enter Bid Amount",
          navigator: _iFlutterNavigator,
          error: true);
    }
  }

  Future<FutureOr<void>> _scrollToTop(
      ScrollToTop event, Emitter<AuctionState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100));
    event.controller.animateTo(event.controller.position.minScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
  }

  FutureOr<void> _buyNow(BuyNow event, Emitter<AuctionState> emit) {
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

  FutureOr<void> _showAutoBid(ShowAutoBid event, Emitter<AuctionState> emit) {
    showAutoBid(event.context, submit: (String max, String rate) async {
      add(AutoBid(max: max, rate: rate));
    }, submitLoading: state.loading);
  }

  Future<FutureOr<void>> _autoBid(
      AutoBid event, Emitter<AuctionState> emit) async {
    if (!state.loading) {
      emit(state.copyWith(loading: true));
      final autoBid = await _apiRepo.post<NilamResponse>(
          endpoint: addAutomaticBid,
          body: AutoBidModel(
              isPercentage: false,
              maxAmount: event.max,
              increaseRate: event.rate,
              auctionId: state.productDetails.auctionId!));
      emit(state.copyWith(loading: false));
      if (autoBid != null) {
        ShowSnackBar(
            message: autoBid.responseMessage!, navigator: _iFlutterNavigator);
      }
    }
  }
}
