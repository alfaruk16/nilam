part of 'order_bloc.dart';

class OrderState extends Equatable {
  const OrderState(
      {this.loading = false, this.orderResponse = const OrderResponse()});

  final bool loading;
  final OrderResponse orderResponse;

  OrderState copyWith(
      {bool? loading,
      List<UserAddress>? addressList,
      OrderResponse? orderResponse}) {
    return OrderState(
        loading: loading ?? this.loading,
        orderResponse: orderResponse ?? this.orderResponse);
  }

  @override
  List<Object> get props => [loading, orderResponse];
}

class OnBoardInitial extends OrderState {}
