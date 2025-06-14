import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/snackbar/show_snackbar.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/data/model/add_cart_model.dart';
import 'package:nilam/features/data/model/get_url_model.dart';
import 'package:nilam/features/data/model/otp_model.dart';
import 'package:nilam/features/data/model/place_order_model.dart';
import 'package:nilam/features/data/model/shipping_charge_model.dart';
import 'package:nilam/features/domain/entities/add_to_cart_response.dart';
import 'package:nilam/features/domain/entities/cart_response.dart';
import 'package:nilam/features/domain/entities/otp_response.dart';
import 'package:nilam/features/domain/entities/place_order_response.dart';
import 'package:nilam/features/domain/entities/profile.dart';
import 'package:nilam/features/domain/entities/search_response.dart';
import 'package:nilam/features/domain/entities/user_address.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/domain/usecases/local_data.dart';
import 'package:nilam/features/presentation/add_edit_address/view/add_edit_address_screen.dart';
import 'package:nilam/features/presentation/cart/widgets/show_address.dart';
import 'package:nilam/features/presentation/online_payment/view/online_payment_screen.dart';
import 'package:nilam/features/presentation/order_details/view/order_details_screen.dart';
import 'package:nilam/features/presentation/profile/widgets/update_email.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._apiRepo, this._iFlutterNavigator, this._localStorageRepo)
      : super(const CartState()) {
    on<GetCart>(_getCart);
    on<GetCurrentCart>(_getCurrentCart);
    on<IncreaseItem>(_increaseItem);
    on<DecreaseItem>(_decreaseItem);
    on<DeleteItem>(_deleteItem);
    on<MarkUnMark>(_markUnMark);
    on<UpdateCart>(_updateCart);
    on<GetAddress>(_getAddress);
    on<EditAddress>(_editAddress);
    on<ChangeAddress>(_changeAddress);
    on<GetPickUpPoints>(_getPickUpPoints);
    on<AddressSelected>(_addressSelected);
    on<GetShippingCost>(_getShippingCost);
    on<ComputeSubTotalAndTotal>(_computeTotalAndSubtotal);
    on<SelectedPaymentMethod>(_selectedPaymentMethod);
    on<PlaceOrder>(_placeOrder);
    on<GetAddressFromLocal>(_getAddressLocal);
    on<GetBuyNowItem>(_getBuyNowItem);
    on<BuyNow>(_buyNow);
    on<AddEmail>(_addEmail);
    on<GetCurrentProfile>(_getCurrentProfile);
    on<OnlinePayment>(_onlinePayment);
    on<SendOtp>(_sendOtp);
    on<SubmitOtp>(_submitOtp);
    on<PickUpPointSelected>(_pickUpPointSelected);

    add(GetCart());
    add(GetAddressFromLocal());
    add(GetPickUpPoints());
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  Future<FutureOr<void>> _getCart(
      GetCart event, Emitter<CartState> emit) async {
    final cart = await _localStorageRepo.readModel<CartResponse>(key: cartDB);
    if (cart != null) {
      List<int> markedList = [];
      for (int i = 0; i < cart.items!.length; i++) {
        if (cart.items![i].isSelected!) {
          markedList.add(cart.items![i].itemId!);
        }
      }
      emit(state.copyWith(cartResponse: cart, markedList: markedList));
    }
  }

  Future<FutureOr<void>> _increaseItem(
      IncreaseItem event, Emitter<CartState> emit) async {
    if (state.isBuyNow) {
      emit(state.copyWith(buyNowQuantity: state.buyNowQuantity + 1));
      add(ComputeSubTotalAndTotal());
    } else {
      final addCart = await _apiRepo.post<AddToCarResponse>(
          endpoint: addToCart,
          body: AddCartModel(
              itemId: event.cartItem.itemId,
              quantity: event.cartItem.cartQuantity!.toInt() + 1,
              stock: event.cartItem.stockQuantity));
      if (addCart != null) {
        add(GetCurrentCart(selectedItem: event.cartItem));
      }
    }
  }

  Future<FutureOr<void>> _decreaseItem(
      DecreaseItem event, Emitter<CartState> emit) async {
    if (state.isBuyNow && state.buyNowQuantity > 1) {
      emit(state.copyWith(buyNowQuantity: state.buyNowQuantity - 1));
      add(ComputeSubTotalAndTotal());
    } else if (event.cartItem.cartQuantity! > 1) {
      final addCart = await _apiRepo.post<AddToCarResponse>(
          endpoint: addToCart,
          body: AddCartModel(
              itemId: event.cartItem.itemId,
              quantity: event.cartItem.cartQuantity!.toInt() - 1,
              stock: event.cartItem.stockQuantity));
      if (addCart != null) {
        add(GetCurrentCart(selectedItem: event.cartItem));
      }
    }
  }

  Future<FutureOr<void>> _deleteItem(
      DeleteItem event, Emitter<CartState> emit) async {
    if (state.isBuyNow) {
      _iFlutterNavigator.pop();
    } else {
      final addCart = await _apiRepo.post<AddToCarResponse>(
          endpoint: removeFromCart,
          body: AddCartModel(
            itemId: event.cartItem.itemId,
          ));
      if (addCart != null) {
        add(GetCurrentCart(selectedItem: event.cartItem));
      }
    }
  }

  Future<FutureOr<void>> _getCurrentCart(
      GetCurrentCart event, Emitter<CartState> emit) async {
    final cart = await _apiRepo.post<CartResponse>(endpoint: getAllCarts);
    if (cart != null) {
      emit(state.copyWith(cartResponse: cart));
      await _localStorageRepo.writeModel(key: cartDB, value: cart);
      add(GetCart());
      add(ComputeSubTotalAndTotal());
      if (cart.items != null &&
          cart.items!.isNotEmpty &&
          state.selectedShippingAddress != -1) {
        final address = state.selectedPickUpPoint != -1
            ? state.pickUpAddressList[state.selectedPickUpPoint]
            : state.addressList[state.selectedShippingAddress];
        final item = event.selectedItem ?? cart.items![0];
        add(GetShippingCost(
            cartType: state.isBuyNow ? "BuyNow" : "Ecommerce",
            itemId: item.itemId!,
            addressId: address.id!,
            quantity: item.cartQuantity!.toInt()));
      }
    }
  }

  FutureOr<void> _markUnMark(MarkUnMark event, Emitter<CartState> emit) {
    if (event.isSelected) {
      emit(state.copyWith(
          markedList:
              List.from(state.markedList..add(event.cartItem.itemId!))));
    } else {
      emit(state.copyWith(
          markedList:
              List.from(state.markedList..remove(event.cartItem.itemId!))));
    }
    add(UpdateCart(cartItem: event.cartItem));
  }

  Future<FutureOr<void>> _updateCart(
      UpdateCart event, Emitter<CartState> emit) async {
    final update = await _apiRepo.post<CartResponse>(
        endpoint: updateCartItems, body: state.markedList);
    if (update != null) {
      emit(state.copyWith(cartResponse: update));
      add(GetShippingCost(
          cartType: state.isBuyNow ? "BuyNow" : "Ecommerce",
          itemId: event.cartItem.itemId!,
          addressId: state.selectedPickUpPoint != -1
              ? state.pickUpAddressList[state.selectedPickUpPoint].id!
              : state.addressList[state.selectedShippingAddress].id!,
          quantity: event.cartItem.cartQuantity!.toInt()));
    }
  }

  Future<FutureOr<void>> _getAddress(
      GetAddress event, Emitter<CartState> emit) async {
    final addressList =
        await _apiRepo.postForList<List<UserAddress>, UserAddress>(
            endpoint: getShippingAddress);

    if (addressList != null) {
      emit(state.copyWith(
          addressList: addressList,
          selectedShippingAddress: addressList.isNotEmpty
              ? state.selectedShippingAddress == -1
                  ? getDefaultAddress(addressList)
                  : state.selectedShippingAddress
              : -1));
      if (state.buyNowItem.itemId == null) {
        add(const GetCurrentCart(selectedItem: null));
      } else {
        add(GetShippingCost(
            cartType: "BuyNow",
            itemId: state.buyNowItem.itemId!,
            addressId: addressList.isNotEmpty
                ? state.selectedShippingAddress == -1
                    ? 0
                    : state.selectedShippingAddress
                : -1,
            quantity: state.buyNowQuantity));
      }
      _localStorageRepo.writeModel(key: addressListDB, value: addressList);
    }
  }

  FutureOr<void> _editAddress(EditAddress event, Emitter<CartState> emit) {
    _iFlutterNavigator
        .push(AddEditAddressScreen.route(
            address: state.addressList[state.selectedShippingAddress]))
        .then((value) => add(GetAddress()));
  }

  FutureOr<void> _changeAddress(ChangeAddress event, Emitter<CartState> emit) {
    showAddress(event.context, address: state.addressList,
        selectedIndex: (index) {
      add(AddressSelected(index: index));
      if (state.cartResponse.items!.isNotEmpty) {
        final item = state.cartResponse.items![0];
        add(GetShippingCost(
            cartType: state.isBuyNow ? "BuyNow" : "Ecommerce",
            itemId: item.itemId!,
            addressId: state.addressList[state.selectedShippingAddress].id!,
            quantity: item.cartQuantity!.toInt()));
      }
    });
  }

  Future<FutureOr<void>> _getPickUpPoints(
      GetPickUpPoints event, Emitter<CartState> emit) async {
    final pickUpAddress = await _apiRepo
        .postForList<List<UserAddress>, UserAddress>(endpoint: getPickupPoint);

    if (pickUpAddress != null) {
      emit(state.copyWith(pickUpAddressList: pickUpAddress));
    }
  }

  FutureOr<void> _addressSelected(
      AddressSelected event, Emitter<CartState> emit) {
    emit(state.copyWith(
        selectedShippingAddress: event.index, selectedPickUpPoint: -1));
  }

  Future<FutureOr<void>> _getShippingCost(
      GetShippingCost event, Emitter<CartState> emit) async {
    final shippingCost = await _apiRepo.post<num>(
        endpoint: getShippingCost,
        body: ShippingChargeModel(
            cartType: event.cartType,
            addressId: event.addressId,
            itemId: event.itemId,
            quantity: event.quantity));
    if (shippingCost != null) {
      emit(state.copyWith(shippingFee: shippingCost.toDouble()));
      add(ComputeSubTotalAndTotal());
    }
  }

  FutureOr<void> _computeTotalAndSubtotal(
      ComputeSubTotalAndTotal event, Emitter<CartState> emit) {
    double subTotal = 0;
    for (int i = 0; i < state.cartResponse.items!.length; i++) {
      final item = state.cartResponse.items![i];
      if (item.isSelected! || state.isBuyNow) {
        subTotal += (item.discountedPrice! > 0
                ? item.discountedPrice!
                : item.salesPrice!) *
            (state.isBuyNow ? state.buyNowQuantity : item.cartQuantity!);
      }
    }
    emit(state.copyWith(
        subTotal: subTotal, total: subTotal + state.shippingFee));
  }

  FutureOr<void> _selectedPaymentMethod(
      SelectedPaymentMethod event, Emitter<CartState> emit) {
    emit(state.copyWith(paymentMethod: event.paymentMethod));
  }

  Future<FutureOr<void>> _placeOrder(
      PlaceOrder event, Emitter<CartState> emit) async {
    if (state.total > 0) {
      if (state.paymentMethod != -1) {
        if (!state.isBuyNow) {
          if (!state.loading) {
            emit(state.copyWith(loading: true));
            final order = await _apiRepo.post<PlaceOrderResponse>(
                endpoint: placeOrder,
                body: PlaceOrderModel(
                    orderType: state.isBuyNow ? "BuyNow" : "Ecommerce",
                    shippedBy: "Nilam",
                    shippingAddressId: state.selectedPickUpPoint != -1
                        ? state.pickUpAddressList[state.selectedPickUpPoint].id!
                        : state.addressList[state.selectedShippingAddress].id!,
                    billingAddressId:
                        state.addressList[state.selectedShippingAddress].id!,
                    orderNote: "orderNote",
                    paymentMode: state.paymentMethod == 1
                        ? "CashOnDelivery"
                        : state.paymentMethod == 2
                            ? "OnlinePayment"
                            : ""));
            emit(state.copyWith(loading: false));
            if (order != null) {
              if (state.paymentMethod == 2) {
                add(OnlinePayment(placeOrderResponse: order));
              } else {
                _iFlutterNavigator.popUntil((route) => route.isFirst);
                _iFlutterNavigator.push(
                    OrderDetailsScreen.route(id: order.responseData!.id!));
              }
              ShowSnackBar(
                  message: order.responseMessage!,
                  navigator: _iFlutterNavigator);
              add(const GetCurrentCart(selectedItem: null));
            }
          }
        } else {
          add(BuyNow());
        }
      } else if (state.paymentMethod == 2 && !await LocalData.hasEmail()) {
        add(AddEmail());
      } else {
        ShowSnackBar(
            message: "Select payment method",
            navigator: _iFlutterNavigator,
            error: true);
      }
    } else {
      ShowSnackBar(
          message: "Please select item",
          navigator: _iFlutterNavigator,
          error: true);
    }
  }

  Future<FutureOr<void>> _getAddressLocal(
      GetAddressFromLocal event, Emitter<CartState> emit) async {
    final addressList = await _localStorageRepo
        .readModelForList<List<UserAddress>, UserAddress>(key: addressListDB);
    if (addressList != null) {
      emit(state.copyWith(
          addressList: addressList,
          selectedShippingAddress:
              addressList.isNotEmpty ? getDefaultAddress(addressList) : -1));
    }
  }

  FutureOr<void> _getBuyNowItem(GetBuyNowItem event, Emitter<CartState> emit) {
    if (event.buyNowItem != null) {
      emit(state.copyWith(
          isBuyNow: true,
          buyNowItem: event.buyNowItem,
          buyNowQuantity: event.buyNowItem!.cartQuantity!.toInt(),
          cartResponse: CartResponse(items: [event.buyNowItem!])));
    }
    add(GetAddress());
  }

  Future<FutureOr<void>> _buyNow(BuyNow event, Emitter<CartState> emit) async {
    if (!state.loading) {
      emit(state.copyWith(loading: true));
      final order = await _apiRepo.post<PlaceOrderResponse>(
          endpoint: placeOrder,
          body: BuyNowModel(
              orderType: "BuyNow",
              shippedBy: "Nilam",
              shippingAddressId: state.selectedPickUpPoint != -1
                  ? state.pickUpAddressList[state.selectedPickUpPoint].id!
                  : state.addressList[state.selectedShippingAddress].id!,
              billingAddressId:
                  state.addressList[state.selectedShippingAddress].id!,
              orderNote: "orderNote",
              paymentMode: state.paymentMethod == 1
                  ? "CashOnDelivery"
                  : state.paymentMethod == 2
                      ? "OnlinePayment"
                      : "",
              isAvailEmi: state.isEmi,
              itemId: state.buyNowItem.itemId!,
              quantity: state.buyNowQuantity,
              salesPrice: state.buyNowItem.salesPrice!.toDouble()));
      emit(state.copyWith(loading: false));
      if (order != null) {
        if (state.paymentMethod == 2) {
          add(OnlinePayment(placeOrderResponse: order));
        } else {
          _iFlutterNavigator.popUntil((route) => route.isFirst);
          _iFlutterNavigator
              .push(OrderDetailsScreen.route(id: order.responseData!.id!));
        }
        ShowSnackBar(
            message: order.responseMessage!, navigator: _iFlutterNavigator);
        add(const GetCurrentCart(selectedItem: null));
      }
    }
  }

  FutureOr<void> _addEmail(AddEmail event, Emitter<CartState> emit) {
    showUpdateEmail(_iFlutterNavigator.context, sendOtp: (String phone) {
      add(SendOtp(phone: phone));
    }, submit: (String otp, String phone) {
      add(SubmitOtp(otp: otp, phone: phone));
    },
        otpLoading: state.otpLoading,
        submitLoading: state.submitOtpLoading,
        email: "");
  }

  Future<FutureOr<void>> _sendOtp(
      SendOtp event, Emitter<CartState> emit) async {
    if (!state.otpLoading) {
      emit(state.copyWith(otpLoading: true));
      final otp = await _apiRepo.post<OtpResponse>(
          endpoint: sendOtpForChange, body: OtpModel(username: event.phone));
      if (otp == null) {
        if (_iFlutterNavigator.canPop()) {
          _iFlutterNavigator.pop();
        }
      } else {
        ShowSnackBar(
            message: otp.responseMessage!, navigator: _iFlutterNavigator);
      }
      emit(state.copyWith(otpLoading: false));
    }
  }

  Future<FutureOr<void>> _submitOtp(
      SubmitOtp event, Emitter<CartState> emit) async {
    if (!state.submitOtpLoading) {
      emit(state.copyWith(submitOtpLoading: true));
      final otp = await _apiRepo.post<OtpResponse>(
          endpoint: validateOtp,
          body: ValidateOtpModel(username: event.otp, otp: event.otp));
      if (otp != null) {
        if (_iFlutterNavigator.canPop()) {
          _iFlutterNavigator.pop();
        }
        ShowSnackBar(
            message: otp.responseMessage!, navigator: _iFlutterNavigator);
        add(GetCurrentProfile());
      }
      emit(state.copyWith(submitOtpLoading: false));
    }
  }

  Future<FutureOr<void>> _getCurrentProfile(
      GetCurrentProfile event, Emitter<CartState> emit) async {
    final profile = await _apiRepo.post<Profile>(endpoint: getUserProfile);
    if (profile != null) {
      _localStorageRepo.writeModel(key: profileDB, value: profile);
    }
  }

  Future<FutureOr<void>> _onlinePayment(
      OnlinePayment event, Emitter<CartState> emit) async {
    if (!state.loading) {
      emit(state.copyWith(loading: true));
      var getUrl = GetUrlModel();
      getUrl.referanceType = "Order";
      getUrl.referanceId = event.placeOrderResponse.responseData!.id!;
      getUrl.amount = event.placeOrderResponse.responseData!.totalAmount!;
      getUrl.isAvailEmi = event.placeOrderResponse.responseData!.isAvailEmi!;
      //onlineUrl.value = await _remoteService.getWay(getUrl);

      final payOnline = await _apiRepo.post<String>(
          endpoint: getPaymentGatewayURL, body: getUrl);

      emit(state.copyWith(loading: false));

      if (payOnline != null) {
        _iFlutterNavigator
            .push(OnlinePaymentScreen.route(url: payOnline))
            .then((value) {
          _iFlutterNavigator.popUntil((route) => route.isFirst);
          _iFlutterNavigator.push(OrderDetailsScreen.route(
              id: event.placeOrderResponse.responseData!.id!));
        });
      }
    }
    //orderId = orderDetails.Id;
    //gateWay = GateWay.fromJson(await _remoteService.getWay());
    //Get.to(OnlinePayment());
    //sslCommerzCustomizedCall(id);
  }

  int getDefaultAddress(List<UserAddress> addressList) {
    for (int i = 0; i < addressList.length; i++) {
      if (addressList[i].isDefault!) {
        return i;
      }
    }
    return 0;
  }

  FutureOr<void> _pickUpPointSelected(
      PickUpPointSelected event, Emitter<CartState> emit) {
    emit(state.copyWith(selectedPickUpPoint: event.index));
    if (state.cartResponse.items != null &&
        state.cartResponse.items!.isNotEmpty) {
      final item = state.cartResponse.items![0];
      add(GetShippingCost(
          cartType: state.isBuyNow ? "BuyNow" : "Ecommerce",
          itemId: item.itemId!,
          addressId: state.pickUpAddressList[event.index].id!,
          quantity: item.cartQuantity!.toInt()));
    }
  }
}
