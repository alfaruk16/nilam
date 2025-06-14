import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/my_bargains_response.dart';

class BargainItemView extends StatelessWidget {
  const BargainItemView(
      {super.key, required this.bargainItem, required this.goToBargain});

  final BargainItem bargainItem;
  final Function goToBargain;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goToBargain(bargainItem);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        color: Colors.teal.withOpacity(.08),
        child: Row(
          children: [
            SizedBox(
                width: 60,
                height: 60,
                child: NetWorkImageViewB(
                    imageUrl: baseUrl + bargainItem.imageUrl!)),
            const SizedBox(width: 10),
            Expanded(
                child: SizedBox(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextB(text: bargainItem.itemName!),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: 60,
                      child: TextB(
                        text: bargainItem.status!,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextB(
                  text: "My Price: ৳${bargainItem.lastSellerAmount!}",
                  fontColor: Colors.black,
                ),
                TextB(text: "Seller Price: ৳${bargainItem.lastBuyerAmount!}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
