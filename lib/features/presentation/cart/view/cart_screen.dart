import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/cart_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/cart/bloc/cart_bloc.dart';
import 'package:nilam/features/presentation/cart/widgets/cart_items.dart';
import 'package:nilam/features/presentation/cart/widgets/order_summery.dart';
import 'package:nilam/features/presentation/cart/widgets/payment_methods.dart';
import 'package:nilam/features/presentation/cart/widgets/pick_up_point.dart';
import 'package:nilam/features/presentation/cart/widgets/pick_up_points.dart';
import 'package:nilam/features/presentation/cart/widgets/shipping_address.dart';
import 'package:nilam/features/presentation/cart/widgets/show_pick_up_points.dart';
import 'package:nilam/features/presentation/home/widgets/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, this.buyNowItem, required this.isEmi});

  final CartItem? buyNowItem;
  final bool isEmi;

  static Route<dynamic> route({CartItem? buyNowItem, required bool isEmi}) =>
      MaterialPageRoute<dynamic>(
        builder: (_) => CartScreen(
          buyNowItem: buyNowItem,
          isEmi: isEmi,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CartBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>())
          ..add(GetBuyNowItem(buyNowItem: buyNowItem, isEmi: isEmi)),
        child: CartView());
  }
}

class CartView extends StatelessWidget {
  CartView({super.key});
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<CartBloc>();

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Body(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                    const SizedBox(width: 5),
                    const Expanded(
                        child: TextB(
                            text: "Cart",
                            fontColor: Colors.black,
                            fontSize: 18)),
                    CartB(cartResponse: state.cartResponse, goToCart: () {}),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  if (state.cartResponse.items != null) const CartItems(),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        const TextB(
                            text: "Shipping Address",
                            fontSize: 16,
                            fontColor: Colors.black),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              bloc.add(EditAddress());
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            )),
                        const SizedBox(width: 10),
                        GestureDetector(
                            onTap: () {
                              bloc.add(ChangeAddress(context: context));
                            },
                            child: const TextB(
                                text: "Change",
                                fontColor: buttonColor,
                                fontSize: 16))
                      ],
                    ),
                  ),
                  state.selectedPickUpPoint != -1
                      ? PickUpPoint(
                          address: state
                              .pickUpAddressList[state.selectedPickUpPoint],
                          change: () {
                            showPickUpPoints(context,
                                address: state.pickUpAddressList,
                                selectedIndex: (index) {
                              bloc.add(PickUpPointSelected(index: index));
                            });
                          },
                        )
                      : state.selectedShippingAddress != -1
                          ? ShippingAddress(
                              address: state
                                  .addressList[state.selectedShippingAddress],
                            )
                          : const SizedBox(),
                  if (state.selectedPickUpPoint == -1)
                    GestureDetector(
                        onTap: () {
                          showPickUpPoints(context,
                              address: state.pickUpAddressList,
                              selectedIndex: (index) {
                            bloc.add(PickUpPointSelected(index: index));
                          });
                        },
                        child: const PickUpPoints()),
                  OrderSummery(
                      subTotal: state.subTotal,
                      shippingFee: state.shippingFee,
                      total: state.total),
                  PaymentMethods(
                    selectedPaymentMethod: (value) {
                      bloc.add(SelectedPaymentMethod(paymentMethod: value));
                    },
                  ),
                  const SizedBox(height: 20)
                ],
              )),
              ButtonB(
                text: "Place Order",
                press: () {
                  bloc.add(PlaceOrder());
                },
                loading: state.loading,
              )
            ],
          ),
        );
      },
    );
  }
}
