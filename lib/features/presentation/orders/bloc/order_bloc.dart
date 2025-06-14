import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/snackbar/show_snackbar.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/data/model/cancel_model.dart';
import 'package:nilam/features/data/model/order_model.dart';
import 'package:nilam/features/domain/entities/nilam_response.dart';
import 'package:nilam/features/domain/entities/order_response.dart';
import 'package:nilam/features/domain/entities/user_address.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/order_details/view/order_details_screen.dart';
import 'package:nilam/features/presentation/orders/widgets/cancel_reason.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this._apiRepo, this._iFlutterNavigator, this._localStorageRepo)
      : super(const OrderState()) {
    on<GetOrders>(_getOrders);
    on<CheckLocal>(_checkLocal);
    on<GoToDetails>(_goToDetails);
    on<CancelOrder>(_cancelOrder);

    add(CheckLocal());
    add(GetOrders());
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  Future<FutureOr<void>> _getOrders(
      GetOrders event, Emitter<OrderState> emit) async {
    final orders = await _apiRepo.post<OrderResponse>(
        endpoint: getMyOrders, body: OrderModel());
    if (orders != null) {
      emit(state.copyWith(orderResponse: orders));
      _localStorageRepo.writeModel(key: ordersDB, value: orders);
    }
  }

  Future<FutureOr<void>> _checkLocal(
      CheckLocal event, Emitter<OrderState> emit) async {
    final orders =
        await _localStorageRepo.readModel<OrderResponse>(key: ordersDB);

    if (orders != null) {
      emit(state.copyWith(orderResponse: orders));
    }
  }

  FutureOr<void> _goToDetails(GoToDetails event, Emitter<OrderState> emit) {
    _iFlutterNavigator
        .push(OrderDetailsScreen.route(id: event.id))
        .then((value) => add(GetOrders()));
  }

  FutureOr<void> _cancelOrder(CancelOrder event, Emitter<OrderState> emit) {
    showCancelReason(event.context, submit: (value) async {
      final cancel = await _apiRepo.post<NilamResponse>(
          endpoint: orderUpdateStatus,
          body: CancelModel(id: event.id, note: value));

      if (cancel != null) {
        ShowSnackBar(
            message: cancel.responseMessage!, navigator: _iFlutterNavigator);
        add(GetOrders());
      }
    });
  }
}
