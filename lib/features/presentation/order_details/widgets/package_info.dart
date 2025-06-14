import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/order_details_response.dart';

class PackageInfo extends StatelessWidget {
  const PackageInfo({super.key, required this.packageInfo});

  final OrderPackage packageInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(.05))),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextB(
            text: "Package Information",
            fontSize: 18,
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(.1))),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextB(
                          text: "Package Number: ${packageInfo.displayId!}",
                          fontColor: Colors.black),
                    ),
                    const SizedBox(width: 5),
                    TextB(
                        text: packageInfo.status!,
                        fontColor: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: TextB(
                          text:
                              "Seller: ${packageInfo.seller!.firstName!}${packageInfo.seller!.lastName!}",
                          fontColor: Colors.cyan),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                TextB(
                  text: "Package Total: ৳${packageInfo.totalAmount}",
                  fontColor: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: packageInfo.itemDetails!.length,
                    itemBuilder: (context, index) {
                      final item = packageInfo.itemDetails![index];
                      return Column(
                        children: [
                          const Divider(),
                          Row(
                            children: [
                              SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: NetworkImageB(
                                      imageUrl: baseUrl + item.imageUrl!)),
                              const SizedBox(width: 5),
                              Expanded(child: TextB(text: item.itemName!)),
                              const SizedBox(width: 5),
                              TextB(
                                  text:
                                      "Qty: ${item.quantity} ${item.measurementName}"),
                              const SizedBox(width: 5),
                              TextB(text: "৳${item.salesPrice}"),
                            ],
                          )
                        ],
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
