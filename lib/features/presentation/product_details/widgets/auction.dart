import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/utils/utilities.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';
import 'package:nilam/features/presentation/home/widgets/products.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Auction extends StatelessWidget {
  const Auction({super.key, required this.productDetails});

  final ProductDetails productDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        productDetails.auctionStatus == "Bidding"
            ? Row(
                children: [
                  const TextB(text: "Time left: ", fontColor: buttonColor),
                  Countdown(
                    seconds: getTimeCount(productDetails.endTime),
                    build: (BuildContext context, double time) => TextB(
                      text: formatTime(time).toString(),
                      fontColor: Colors.black,
                      fontSize: 18,
                    ),
                    interval: const Duration(milliseconds: 1000),
                    onFinished: () {},
                  )
                ],
              )
            : const TextB(text: "Nilam is closed", fontColor: Colors.red),
        Row(
          children: [
            const TextB(text: "Current Bid:"),
            TextB(
                text: "৳${productDetails.currentBid!}",
                fontSize: 18,
                fontColor: buttonColor),
          ],
        ),
        Row(
          children: [
            const TextB(text: "Reserved Price:"),
            TextB(
                text: "৳${productDetails.approximatePrice!}",
                fontSize: 18,
                fontColor: Colors.black),
          ],
        ),
        if (productDetails.auctionStatus == "Bidding")
          Row(
            children: [
              const TextB(text: "Buy Now Price:"),
              TextB(
                  text:
                      "৳${productDetails.salesPrice!}/${productDetails.measurementName}",
                  fontSize: 18,
                  fontColor: Colors.black),
              // const SizedBox(width: 10),
              // const TextB(
              //     text: "Buy Now", fontSize: 18, fontColor: Colors.black),
            ],
          ),
        Row(
          children: [
            TextB(
                text:
                    "Active Bidders ${productDetails.bidderCount}  Total Bid: ${productDetails.bidCount}")
          ],
        ),
      ],
    );
  }
}
