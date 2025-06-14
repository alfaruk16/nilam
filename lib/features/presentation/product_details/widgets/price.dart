import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';

class Price extends StatelessWidget{
  const Price({super.key, required this.productDetails});

  final ProductDetails productDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextB(
          text: "৳${productDetails.salesPrice}",
          fontColor: buttonColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(width: 10),
        if (productDetails.discountedPrice! > 0)
          Text(
            "৳${productDetails.discountedPrice}",
            style: const TextStyle(decoration: TextDecoration.lineThrough),
          ),
        const SizedBox(width: 10),
        if (productDetails.discountTag != null &&
            productDetails.discountTag!.isNotEmpty)
          TextB(
            text: "(${productDetails.discountTag})",
            fontSize: 16,
            fontColor: Colors.cyan,
            fontWeight: FontWeight.w600,
          ),

      ],
    );
  }

}