part of 'online_payment_bloc.dart';

abstract class OnlinePaymentEvent extends Equatable {
  const OnlinePaymentEvent();

  @override
  List<Object> get props => [];
}

class PopToCart extends OnlinePaymentEvent{
  const PopToCart({required this.id});
  final String id;
}
