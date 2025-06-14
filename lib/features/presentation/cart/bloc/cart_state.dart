part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState(
      {this.loading = false,
      this.searchResponse = const SearchResponse(),
      this.cartResponse = const CartResponse(),
      this.markedList = const [],
      this.addressList = const [],
      this.pickUpAddressList = const [],
      this.selectedShippingAddress = -1,
      this.selectedPickUpPoint = -1,
      this.subTotal = 0,
      this.shippingFee = 0,
      this.total = 0,
      this.paymentMethod = -1,
      this.buyNowItem = const CartItem(),
      this.buyNowQuantity = 1,
      this.isEmi = false,
      this.isBuyNow = false,
      this.otpLoading = false,
      this.submitOtpLoading = false});

  final bool loading, otpLoading, submitOtpLoading;
  final SearchResponse searchResponse;
  final CartResponse cartResponse;
  final List<int> markedList;
  final List<UserAddress> addressList;
  final List<UserAddress> pickUpAddressList;
  final int selectedShippingAddress;
  final int selectedPickUpPoint;
  final double subTotal, shippingFee, total;
  final int paymentMethod;
  final CartItem buyNowItem;
  final int buyNowQuantity;
  final bool isEmi;
  final bool isBuyNow;

  CartState copyWith(
      {bool? loading,
      SearchResponse? searchResponse,
      CartResponse? cartResponse,
      List<int>? markedList,
      List<UserAddress>? addressList,
      List<UserAddress>? pickUpAddressList,
      int? selectedShippingAddress,
      int? selectedPickUpPoint,
      double? subTotal,
      double? shippingFee,
      double? total,
      int? paymentMethod,
      CartItem? buyNowItem,
      int? buyNowQuantity,
      bool? isEmi,
      bool? isBuyNow,
      bool? otpLoading,
      bool? submitOtpLoading}) {
    return CartState(
        loading: loading ?? this.loading,
        searchResponse: searchResponse ?? this.searchResponse,
        cartResponse: cartResponse ?? this.cartResponse,
        markedList: markedList ?? this.markedList,
        addressList: addressList ?? this.addressList,
        pickUpAddressList: pickUpAddressList ?? this.pickUpAddressList,
        selectedShippingAddress:
            selectedShippingAddress ?? this.selectedShippingAddress,
        selectedPickUpPoint: selectedPickUpPoint ?? this.selectedPickUpPoint,
        subTotal: subTotal ?? this.subTotal,
        shippingFee: shippingFee ?? this.shippingFee,
        total: total ?? this.total,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        buyNowItem: buyNowItem ?? this.buyNowItem,
        buyNowQuantity: buyNowQuantity ?? this.buyNowQuantity,
        isEmi: isEmi ?? this.isEmi,
        isBuyNow: isBuyNow ?? this.isBuyNow,
        otpLoading: otpLoading ?? this.otpLoading,
        submitOtpLoading: submitOtpLoading ?? this.submitOtpLoading);
  }

  @override
  List<Object> get props => [
        loading,
        searchResponse,
        cartResponse,
        markedList,
        addressList,
        pickUpAddressList,
        selectedShippingAddress,
        selectedPickUpPoint,
        subTotal,
        shippingFee,
        total,
        paymentMethod,
        buyNowItem,
        buyNowQuantity,
        isEmi,
        isBuyNow,
        otpLoading,
        submitOtpLoading
      ];
}

class OnBoardInitial extends CartState {}
