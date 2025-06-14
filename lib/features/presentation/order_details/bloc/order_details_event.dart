part of 'order_details_bloc.dart';

abstract class OrderDetailsEvent extends Equatable {
  const OrderDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetOrder extends OrderDetailsEvent {
  const GetOrder({required this.id});
  final int id;
}

class CancelOrder extends OrderDetailsEvent {
  const CancelOrder({required this.id, required this.context});
  final int id;
  final BuildContext context;
}

class PayNow extends OrderDetailsEvent{}
