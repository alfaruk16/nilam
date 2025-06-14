import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/utils/utilities.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';
import 'package:nilam/features/presentation/home/widgets/products.dart';
import 'package:timer_count_down/timer_count_down.dart';

class AuctionInfo extends StatelessWidget {
  const AuctionInfo(
      {super.key,
      required this.productDetails,
      required this.buyNow,
      required this.autoBid});

  final ProductDetails productDetails;
  final VoidCallback buyNow;
  final VoidCallback autoBid;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //height: 120,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (productDetails.id != null)
              SizedBox(
                height: 60,
                width: 60,
                child: NetworkImageB(
                    imageUrl:
                        "$baseUrl${productDetails.documents![0].localPath!}/${productDetails.documents![0].uuid!}"),
              ),
            const SizedBox(width: 10),
            if (productDetails.id != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextB(
                        text: "Buy Now Price: ৳${productDetails.salesPrice}",
                        fontColor: Colors.black,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          buyNow();
                        },
                        child: const TextB(
                          text: "Buy Now",
                          fontColor: buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      TextB(
                          text: "Item ID: ${productDetails.displayId}",
                          fontColor: Colors.black),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          autoBid();
                        },
                        child: const TextB(
                            text: "automatic bid",
                            fontWeight: FontWeight.bold,
                            fontColor: buttonColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  TextB(
                      text:
                          "Reserve Price: ৳${productDetails.approximatePrice}",
                      fontColor: Colors.black),
                ],
              ),
          ],
        ),
        Row(
          children: [
            TextB(
                text: "Bidder: ${productDetails.bidderCount},",
                fontColor: Colors.black),
            const SizedBox(width: 10),
            TextB(
                text: "Total Bid: ${productDetails.bidCount}",
                fontColor: Colors.black),
            const SizedBox(width: 10),
            productDetails.auctionStatus == "Bidding"
                ? Row(
                    children: [
                      const TextB(text: "Time left: ", fontColor: buttonColor),
                      Countdown(
                        seconds: getTimeCount(productDetails.endTime),
                        build: (BuildContext context, double time) => TextB(
                          text: formatTime(time).toString(),
                          fontColor: Colors.black,
                          fontSize: 16,
                        ),
                        interval: const Duration(milliseconds: 1000),
                        onFinished: () {},
                      )
                    ],
                  )
                : const TextB(text: "Nilam is closed", fontColor: Colors.red),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            TextB(
                text: "Starting: ৳${productDetails.basePrice},",
                fontColor: Colors.black),
            const SizedBox(width: 10),
            TextB(
                text: "Current: ৳${productDetails.currentBid},",
                fontColor: Colors.black),
            const SizedBox(width: 10),
            TextB(
                text: "Your: ৳${productDetails.userLastBid}",
                fontColor: Colors.black,
                fontWeight: FontWeight.w500),
          ],
        ),
      ]),
    );
  }
}
