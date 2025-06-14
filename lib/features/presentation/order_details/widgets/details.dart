import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/order_details_response.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key, required this.order, required this.cancel});

  final Order order;
  final VoidCallback cancel;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(.05))),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              const TextB(
                  text: "Order Details", fontColor: Colors.black, fontSize: 18),
              const Spacer(),
              if (order.status != "Canceled")
                GestureDetector(
                    onTap: () {
                      cancel();
                    },
                    child: const TextB(
                        text: "Cancel", fontSize: 16, fontColor: Colors.red)),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(.1))),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 85,
                      child: Row(
                        children: [
                          TextB(
                              text: "Order Number: ${order.displayId}",
                              fontColor: Colors.black),
                          const Spacer(),
                          TextB(
                              text: order.status!,
                              fontColor: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 85,
                      child: Row(
                        children: [
                          TextB(
                              text: DateFormat("dd-MMM-yyyy hh:mm a")
                                  .format(order.orderedAt!),
                              fontColor: Colors.green),
                          const Spacer(),
                          TextB(
                            text: "Total: ৳${order.totalAmount}",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontColor: Colors.cyan,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
