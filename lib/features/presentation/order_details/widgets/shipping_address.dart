import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/order_details_response.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(.4))),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            color: Colors.black.withOpacity(.04),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const TextB(
              text: "Shipping Address",
              fontSize: 16,
              fontColor: Colors.black,
            ),
          ),
          summeryItem("Name: ", order.shippingAddress!.name ?? ""),
          summeryItem("Phone: ", order.shippingAddress!.mobile ?? ""),
          summeryItem("Email: ", order.shippingAddress!.email ?? ""),
          summeryItem("Address: ", order.shippingAddress!.address1 ?? ""),
        ],
      ),
    );
  }
}

Widget summeryItem(String title, String text,
    {Color color = Colors.black, FontWeight fontWeight = FontWeight.w500}) {
  return Column(
    children: [
      const SizedBox(height: 5),
      Row(
        children: [
          const SizedBox(width: 10),
          SizedBox(
              width: 150,
              child: TextB(
                text: "$title: ",
                fontColor: Colors.black,
                fontSize: 16,
              )),
          TextB(
            text: text,
            fontColor: color,
            fontSize: 16,
            fontWeight: fontWeight,
          )
        ],
      ),
      const SizedBox(height: 5)
    ],
  );
}
