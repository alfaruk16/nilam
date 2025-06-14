import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/check_box.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/presentation/cart/bloc/cart_bloc.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CartBloc>();

    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return ListView.builder(
          itemCount: state.cartResponse.items!.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final item = state.cartResponse.items![index];
            return Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  if (state.buyNowItem.itemId == null)
                    CheckboxB(
                        label: "",
                        press: (value) {
                          bloc.add(
                              MarkUnMark(cartItem: item, isSelected: value));
                        },
                        defaultValue: item.isSelected!),
                  const SizedBox(width: 5),
                  SizedBox(
                      height: 70,
                      width: 70,
                      child: NetworkImageB(imageUrl: baseUrl + item.imageUrl!)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextB(text: item.itemName!, maxLines: 2),
                            ),
                            const SizedBox(width: 20),
                            if (!state.isBuyNow)
                              GestureDetector(
                                  onTap: () {
                                    bloc.add(DeleteItem(cartItem: item));
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.black54,
                                  )),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            TextB(
                                text:
                                    "tk ${(item.discountedPrice != 0 ? item.discountedPrice : item.salesPrice)! * item.cartQuantity!}",
                                fontColor: buttonColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(.7)),
                                  color: Colors.white),
                              child: GestureDetector(
                                onTap: () {
                                  bloc.add(DecreaseItem(cartItem: item));
                                },
                                child: const Icon(Icons.remove,
                                    color: Colors.black54),
                              ),
                            ),
                            Container(
                              width: 40,
                              alignment: Alignment.center,
                              child: TextB(
                                  text: state.isBuyNow
                                      ? state.buyNowQuantity.toString()
                                      : item.cartQuantity!.toInt().toString(),
                                  fontColor: Colors.black),
                            ),
                            GestureDetector(
                                onTap: () {
                                  bloc.add(IncreaseItem(cartItem: item));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      border: Border.all(
                                          color: Colors.black.withOpacity(.7)),
                                      color: Colors.white),
                                  child: const Icon(Icons.add,
                                      color: Colors.black54),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}
