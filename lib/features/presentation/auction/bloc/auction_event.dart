part of 'auction_bloc.dart';

abstract class AuctionEvent extends Equatable {
  const AuctionEvent();

  @override
  List<Object> get props => [];
}

class GetProduct extends AuctionEvent {
  const GetProduct({required this.product, required this.isEmi});
  final ProductDetails product;
  final bool isEmi;
}

class BidChanged extends AuctionEvent {
  const BidChanged({required this.text});
  final String text;
}

class GetBiddingInfo extends AuctionEvent {
  const GetBiddingInfo({required this.id, this.controller});
  final String id;
  final ScrollController? controller;
}

class ApplyBid extends AuctionEvent {
  const ApplyBid({required this.bidController, required this.controller});
  final TextEditingController bidController;
  final ScrollController controller;
}

class ScrollToTop extends AuctionEvent {
  const ScrollToTop({required this.controller});
  final ScrollController controller;
}

class BuyNow extends AuctionEvent {
  const BuyNow({required this.amount});
  final double amount;
}

class ShowAutoBid extends AuctionEvent {
  const ShowAutoBid({required this.context});
  final BuildContext context;
}

class AutoBid extends AuctionEvent {
  const AutoBid({required this.max, required this.rate});
  final String max;
  final String rate;
}
