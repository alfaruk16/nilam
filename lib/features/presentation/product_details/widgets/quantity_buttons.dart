import 'package:flutter/material.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';

class QuantityButtons extends StatelessWidget {
  const QuantityButtons(
      {super.key,
      required this.productDetails,
      required this.increase,
      required this.decrease,
      required this.quantity});

  final ProductDetails productDetails;
  final Function increase;
  final Function decrease;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (productDetails.saleType != SaleType.Auction.name)
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black.withOpacity(.7)),
                color: Colors.white),
            child: GestureDetector(
              onTap: () {
                decrease();
              },
              child: const Icon(Icons.remove, color: Colors.black54),
            ),
          ),
        if (productDetails.saleType != SaleType.Auction.name)
          Container(
            width: 40,
            alignment: Alignment.center,
            child: TextB(text: quantity.toString(), fontColor: Colors.black),
          ),
        if (productDetails.saleType != SaleType.Auction.name)
          GestureDetector(
              onTap: () {
                increase();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.black.withOpacity(.7)),
                    color: Colors.white),
                child: const Icon(Icons.add, color: Colors.black54),
              )),
      ],
    );
  }
}
