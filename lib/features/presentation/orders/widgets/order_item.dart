import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/order_response.dart';

class OrderItemView extends StatelessWidget {
  const OrderItemView(
      {super.key,
      required this.orderItem,
      required this.details,
      required this.cancel});

  final OrderItem orderItem;
  final Function details;
  final Function cancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextB(
            text: "Order Number: ${orderItem.displayId!}",
            fontColor: Colors.black,
            fontSize: 16,
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextB(
                      text: "Shipping Address:",
                      fontColor: Colors.black,
                      fontSize: 16),
                  TextB(text: orderItem.name!),
                  TextB(text: orderItem.address1!),
                  TextB(text: orderItem.mobile!),
                ],
              )),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextB(
                    text: "Order Total: ৳${orderItem.totalAmount}",
                    fontColor: buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                  TextB(
                      text:
                          "Received Amount: ৳${orderItem.totalReceivedAmount}"),
                  TextB(text: "Status: ${orderItem.status}"),
                  TextB(text: "Payment Status: ${orderItem.paymentStatus}"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  details(orderItem.id);
                },
                child: const TextB(
                    text: "Details",
                    fontColor: buttonColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 10),
              if (orderItem.status != "Canceled")
                GestureDetector(
                  onTap: () {
                    cancel(orderItem.id);
                  },
                  child: const TextB(
                    text: "Cancel",
                    fontColor: Colors.red,
                    fontSize: 16,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
