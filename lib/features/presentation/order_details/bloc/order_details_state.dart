part of 'order_details_bloc.dart';

class OrderDetailsState extends Equatable {
  const OrderDetailsState(
      {this.loading = false,
      this.orderDetailsResponse = const OrderDetailsResponse(),
      this.id = -1});

  final bool loading;
  final int id;
  final OrderDetailsResponse orderDetailsResponse;

  OrderDetailsState copyWith(
      {bool? loading,
      List<UserAddress>? addressList,
      OrderDetailsResponse? orderDetailsResponse,
      int? id}) {
    return OrderDetailsState(
        loading: loading ?? this.loading,
        orderDetailsResponse: orderDetailsResponse ?? this.orderDetailsResponse,
        id: id ?? this.id);
  }

  @override
  List<Object> get props => [loading, orderDetailsResponse, id];
}

class OnBoardInitial extends OrderDetailsState {}
