part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class GetOrders extends OrderEvent {}

class CheckLocal extends OrderEvent {}

class GoToDetails extends OrderEvent {
  const GoToDetails({required this.id});
  final int id;
}

class CancelOrder extends OrderEvent {
  const CancelOrder({required this.id, required this.context});
  final int id;
  final BuildContext context;
}
