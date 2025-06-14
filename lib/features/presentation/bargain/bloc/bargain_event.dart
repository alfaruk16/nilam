part of 'bargain_bloc.dart';

abstract class BargainEvent extends Equatable {
  const BargainEvent();

  @override
  List<Object> get props => [];
}

class GetProduct extends BargainEvent {
  const GetProduct({required this.product, required this.isEmi});
  final ProductDetails product;
  final bool isEmi;
}

class IncreaseItem extends BargainEvent {}

class DecreaseItem extends BargainEvent {}

class BargainChanged extends BargainEvent {
  const BargainChanged({required this.text});
  final String text;
}

class GetBargainInfo extends BargainEvent {
  const GetBargainInfo({required this.id, this.controller});
  final String id;
  final ScrollController? controller;
}

class ApplyBargain extends BargainEvent {
  const ApplyBargain(
      {required this.bargainController, required this.controller});
  final TextEditingController bargainController;
  final ScrollController controller;
}

class CancelBargain extends BargainEvent {}

class ScrollToBottom extends BargainEvent {
  const ScrollToBottom({required this.controller});
  final ScrollController controller;
}

class BuyNow extends BargainEvent {
  const BuyNow({required this.amount});
  final double amount;
}
