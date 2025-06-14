import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/text.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery(
      {super.key,
      required this.subTotal,
      required this.shippingFee,
      required this.total});

  final double subTotal;
  final double shippingFee;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const TextB(
              text: "Order Summery", fontSize: 16, fontColor: Colors.black),
          Row(
            children: [
              const TextB(text: "Sub Total: "),
              const Spacer(),
              TextB(text: subTotal.toString()),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const TextB(text: "Shipping Fee: "),
              const Spacer(),
              TextB(text: shippingFee.toString()),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const TextB(text: "Total: "),
              const Spacer(),
              TextB(text: total.toString()),
            ],
          )
        ],
      ),
    );
  }
}
