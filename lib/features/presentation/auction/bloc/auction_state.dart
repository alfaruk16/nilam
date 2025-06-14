part of 'auction_bloc.dart';

class AuctionState extends Equatable {
  const AuctionState(
      {this.productDetails = const ProductDetails(),
      this.loading = false,
      this.quantity = 1,
      this.amount = "",
      this.bidResponse = const [],
      this.isEmi = false,
      this.profile = const Profile()});

  final ProductDetails productDetails;
  final bool loading;
  final int quantity;
  final String amount;
  final List<BidInfoResponse> bidResponse;
  final bool isEmi;
  final Profile profile;

  AuctionState copyWith(
      {ProductDetails? productDetails,
      bool? loading,
      int? quantity,
      String? amount,
      List<BidInfoResponse>? bidResponse,
      bool? isEmi,
      Profile? profile}) {
    return AuctionState(
        productDetails: productDetails ?? this.productDetails,
        loading: loading ?? this.loading,
        quantity: quantity ?? this.quantity,
        amount: amount ?? this.amount,
        bidResponse: bidResponse ?? this.bidResponse,
        isEmi: isEmi ?? this.isEmi,
        profile: profile ?? this.profile);
  }

  @override
  List<Object> get props =>
      [productDetails, loading, quantity, amount, bidResponse, isEmi, profile];
}

class OnBoardInitial extends AuctionState {}
