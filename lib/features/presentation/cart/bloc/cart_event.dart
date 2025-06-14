part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCart extends CartEvent {}

class GetCurrentCart extends CartEvent {
  const GetCurrentCart({required this.selectedItem});
  final CartItem? selectedItem;
}

class IncreaseItem extends CartEvent {
  const IncreaseItem({required this.cartItem});
  final CartItem cartItem;
}

class DecreaseItem extends CartEvent {
  const DecreaseItem({required this.cartItem});
  final CartItem cartItem;
}

class DeleteItem extends CartEvent {
  const DeleteItem({required this.cartItem});
  final CartItem cartItem;
}

class MarkUnMark extends CartEvent {
  const MarkUnMark({required this.cartItem, required this.isSelected});
  final CartItem cartItem;
  final bool isSelected;
}

class UpdateCart extends CartEvent {
  const UpdateCart({required this.cartItem});
  final CartItem cartItem;
}

class GetAddress extends CartEvent {}

class GetAddressFromLocal extends CartEvent {}

class EditAddress extends CartEvent {}

class ChangeAddress extends CartEvent {
  const ChangeAddress({required this.context});
  final BuildContext context;
}

class GetPickUpPoints extends CartEvent {}

class AddressSelected extends CartEvent {
  const AddressSelected({required this.index});
  final int index;
}

class PickUpPointSelected extends CartEvent {
  const PickUpPointSelected({required this.index});
  final int index;
}

class GetShippingCost extends CartEvent {
  const GetShippingCost(
      {required this.cartType,
      required this.itemId,
      required this.addressId,
      required this.quantity});
  final String cartType;
  final int itemId;
  final int addressId;
  final int quantity;
}

class ComputeSubTotalAndTotal extends CartEvent {}

class SelectedPaymentMethod extends CartEvent {
  const SelectedPaymentMethod({required this.paymentMethod});
  final int paymentMethod;
}

class PlaceOrder extends CartEvent {}

class GetBuyNowItem extends CartEvent {
  const GetBuyNowItem({required this.buyNowItem, required this.isEmi});
  final CartItem? buyNowItem;
  final bool isEmi;
}

class BuyNow extends CartEvent {}

class AddEmail extends CartEvent {}

class GetCurrentProfile extends CartEvent {}

class OnlinePayment extends CartEvent {
  const OnlinePayment({required this.placeOrderResponse});
  final PlaceOrderResponse placeOrderResponse;
}

class SendOtp extends CartEvent {
  const SendOtp({required this.phone});
  final String phone;
}

class SubmitOtp extends CartEvent {
  const SubmitOtp({required this.otp, required this.phone});
  final String otp;
  final String phone;
}
