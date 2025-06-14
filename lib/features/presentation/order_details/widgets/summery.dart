import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/order_details_response.dart';

class Summery extends StatelessWidget {
  const Summery({super.key, required this.order, required this.payNow, required this.loading});

  final Order order;
  final VoidCallback payNow;
  final bool loading;

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
              text: "Total Summery",
              fontSize: 16,
              fontColor: Colors.black,
            ),
          ),
          summeryItem("Subtotal", order.totalAmount!.toString()),
          summeryItem("Shipping Fee", order.totalChargeAmount!.toString()),
          summeryItem("Payment Mode", order.paymentMode!.toString()),
          summeryItem("Payment Status", order.paymentStatus!.toString()),
          summeryItem("Total", order.netTotalAmount!.toString(),
              color: buttonColor, fontWeight: FontWeight.bold),
          if(order.paymentMode == "OnlinePayment" && order.paymentStatus == "UnPaid")
            ButtonB(text: "Pay Now", press: (){
              payNow();
            }, loading: loading)
        ],
      ),
    );
  }
}

Widget summeryItem(String title, String text,
    {Color color = Colors.black, FontWeight fontWeight = FontWeight.normal}) {
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
      const Divider()
    ],
  );
}
