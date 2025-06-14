import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/cart_response.dart';

class CartB extends StatelessWidget {
  const CartB({super.key, required this.cartResponse, required this.goToCart});

  final CartResponse cartResponse;
  final Function goToCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goToCart();
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          const SizedBox(
            width: 50,
            height: 50,
            child: Icon(Icons.shopping_cart_outlined, size: 30),
          ),
          if (cartResponse.items != null && cartResponse.items!.isNotEmpty)
            Container(
              alignment: Alignment.center,
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0XFFFAB977),
                    Color(0XFFF98309),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: nBrand.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextB(
                text: cartResponse.items!.length.toString(),
                fontColor: nWhite,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
        ],
      ),
    );
  }
}
