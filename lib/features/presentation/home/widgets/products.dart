import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/utils/utilities.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/all_blocks_response.dart';
import 'package:nilam/features/domain/entities/product_response.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ProductsB extends StatelessWidget {
  const ProductsB(
      {super.key,
      this.block,
      required this.products,
      required this.goToDetails,
      this.goToSearch,
      required this.addToFavorite});

  final BlockResponse? block;
  final List<Product> products;
  final Function goToDetails;
  final Function? goToSearch;
  final Function addToFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: Colors.blueGrey.withOpacity(.1),
        padding: EdgeInsets.all(products.isNotEmpty ? 8 : 0),
        child: Column(
          children: [
            if (block != null)
              Row(
                children: [
                  TextB(
                      text: block!.name!,
                      fontColor: Colors.black,
                      fontSize: 16),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        if (goToSearch != null) {
                          goToSearch!(block!.detailsLink!);
                        }
                      },
                      child: const TextB(text: "show all"))
                ],
              ),
            if (block != null) const Divider(),
            GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: products.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    childAspectRatio: .75),
                itemBuilder: (BuildContext context, int index) {
                  final item = products[index];
                  return GestureDetector(
                    onTap: () {
                      goToDetails(item);
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: imageView(item, addToFavorite)),
                          const Divider(height: 1),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: TextB(
                                      text: item.itemName!.toString(),
                                      fontColor: Colors.black,
                                      fontSize: 14,
                                      maxLines: 2),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextB(
                                        text:
                                            "৳${item.saleType == SaleType.Auction.name ? item.maxBidAmount! > 0 ? item.maxBidAmount : item.basePrice : item.salesPrice}",
                                        fontColor: buttonColor,
                                        fontWeight: FontWeight.w600),
                                    const SizedBox(width: 10),
                                    if (item.discountedPrice! > 0)
                                      Text(
                                        "৳${item.discountedPrice}",
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 5)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

Widget imageView(Product item, Function addToFavorite) {
  return Stack(
    children: [
      NetworkImageB(imageUrl: baseUrl + item.imageUrl!),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.discountTag != null &&
                        item.discountTag!.isNotEmpty)
                      Container(
                          color: buttonColor,
                          margin: const EdgeInsets.only(top: 5, left: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: TextB(
                              text: item.discountTag!,
                              fontColor: Colors.white,
                              fontWeight: FontWeight.w600)),
                    if (item.condition != null &&
                        item.condition!.isNotEmpty &&
                        item.condition != "New")
                      Container(
                          color: Colors.cyan,
                          margin: const EdgeInsets.only(top: 5, left: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: TextB(
                              text: item.condition!,
                              fontColor: Colors.white,
                              fontWeight: FontWeight.w600)),
                    if (item.isEmi != null && item.isEmi!)
                      Container(
                          color: Colors.cyan,
                          margin: const EdgeInsets.only(top: 5, left: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: const TextB(
                              text: "EMI",
                              fontColor: Colors.white,
                              fontWeight: FontWeight.w600)),
                    if (item.stockType != null &&
                        item.stockType!.isNotEmpty &&
                        item.stockType != "Single")
                      Container(
                          color: Colors.cyan,
                          margin: const EdgeInsets.only(top: 5, left: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: TextB(
                              text: item.stockType!,
                              fontColor: Colors.white,
                              fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(5),
              //   child: GestureDetector(
              //       onTap: () {
              //         addToFavorite(item.id);
              //       },
              //       child: Icon(
              //         item.isFavorite! ? Icons.favorite : Icons.favorite_border,
              //         color: item.isFavorite! ? buttonColor : null,
              //       )),
              // )
            ],
          ),
          const Spacer(),
          if (item.saleType != null && item.saleType == SaleType.Bargain.name)
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                  color: Colors.green,
                  margin: const EdgeInsets.only(top: 5, left: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: const TextB(
                      text: "Bargain",
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
          if (item.saleType != null && item.saleType == SaleType.Auction.name)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              color: Colors.white,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(.1)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: item.auctionStatus == "Bidding"
                              ? Countdown(
                                  seconds: getTimeCount(item.endTime),
                                  build: (BuildContext context, double time) =>
                                      TextB(
                                    text: formatTime(time).toString(),
                                    fontColor: Colors.black,
                                  ),
                                  interval: const Duration(milliseconds: 1000),
                                  onFinished: () {},
                                )
                              : const TextB(text: "Ended")),
                      const TextB(text: "Bid:"),
                      const SizedBox(width: 2),
                      TextB(
                        text: item.bidCount.toString(),
                        fontWeight: FontWeight.bold,
                        fontColor: Colors.black,
                      ),
                    ],
                  )),
            ),
        ],
      ),
    ],
  );
}


String formatTime(double time) {
  int second = (time % 60).toInt();
  time /= 60;
  int minute = (time % 60).toInt();
  time /= 60;
  int hour = (time % 24).toInt();
  int day = (time /= 24).toInt();

  return "${day}d ${hour}h ${minute}m ${second}s";
}
