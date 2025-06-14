import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/snackbar/show_snackbar.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/data/model/cancel_model.dart';
import 'package:nilam/features/data/model/get_url_model.dart';
import 'package:nilam/features/domain/entities/nilam_response.dart';
import 'package:nilam/features/domain/entities/order_details_response.dart';
import 'package:nilam/features/domain/entities/user_address.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/presentation/online_payment/view/online_payment_screen.dart';
import 'package:nilam/features/presentation/orders/widgets/cancel_reason.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc(
      this._apiRepo, this._iFlutterNavigator)
      : super(const OrderDetailsState()) {
    on<GetOrder>(_getOrders);
    on<CancelOrder>(_cancelOrder);
    on<PayNow>(_payNow);
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;

  Future<FutureOr<void>> _getOrders(
      GetOrder event, Emitter<OrderDetailsState> emit) async {
    emit(state.copyWith(id: event.id, loading: true));
    final orderDetails = await _apiRepo.post<OrderDetailsResponse>(
        endpoint: getMyOrderDetails(event.id.toString()));
    if (orderDetails != null) {
      emit(state.copyWith(orderDetailsResponse: orderDetails));
      log(orderDetails.toJson().toString());
    }
    emit(state.copyWith(loading: false));
  }

  FutureOr<void> _cancelOrder(
      CancelOrder event, Emitter<OrderDetailsState> emit) {
    showCancelReason(event.context, submit: (value) async {
      final cancel = await _apiRepo.post<NilamResponse>(
          endpoint: orderUpdateStatus,
          body: CancelModel(id: event.id, note: value));

      if (cancel != null) {
        ShowSnackBar(
            message: cancel.responseMessage!, navigator: _iFlutterNavigator);
        add(GetOrder(id: state.id));
      }
    });
  }

  Future<FutureOr<void>> _payNow(
      PayNow event, Emitter<OrderDetailsState> emit) async {
    if (!state.loading) {
      emit(state.copyWith(loading: true));
      var getUrl = GetUrlModel();
      getUrl.referanceType = "Order";
      getUrl.referanceId = state.id;
      getUrl.amount = state.orderDetailsResponse.order!.netTotalAmount!;
      getUrl.isAvailEmi = state.orderDetailsResponse.order!.isAvailEmi!;
      //onlineUrl.value = await _remoteService.getWay(getUrl);

      final payOnline = await _apiRepo.post<String>(
          endpoint: getPaymentGatewayURL, body: getUrl);

      emit(state.copyWith(loading: false));
      if (payOnline != null) {
        _iFlutterNavigator
            .push(OnlinePaymentScreen.route(url: payOnline))
            .then((value) {
          add(GetOrder(id: state.id));
        });
      }
    }
  }
}
