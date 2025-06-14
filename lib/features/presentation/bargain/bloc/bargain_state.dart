part of 'bargain_bloc.dart';

class BargainState extends Equatable {
  const BargainState({
    this.productDetails = const ProductDetails(),
    this.loading = false,
    this.quantity = 1,
    this.bargainAmount = "",
    this.bargainInfoResponse = const BargainInfoResponse(),
    this.isEmi = false
  });

  final ProductDetails productDetails;
  final bool loading;
  final int quantity;
  final String bargainAmount;
  final BargainInfoResponse bargainInfoResponse;
  final bool isEmi;

  BargainState copyWith(
      {ProductDetails? productDetails,
      bool? loading,
      int? quantity,
      String? bargainAmount,
      BargainInfoResponse? bargainInfoResponse, bool? isEmi}) {
    return BargainState(
        productDetails: productDetails ?? this.productDetails,
        loading: loading ?? this.loading,
        quantity: quantity ?? this.quantity,
        bargainAmount: bargainAmount ?? this.bargainAmount,
        bargainInfoResponse: bargainInfoResponse ?? this.bargainInfoResponse, isEmi: isEmi ?? this.isEmi);
  }

  @override
  List<Object> get props =>
      [productDetails, loading, quantity, bargainAmount, bargainInfoResponse, isEmi];
}

class OnBoardInitial extends BargainState {}
