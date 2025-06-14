import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/all_blocks_response.dart';
import 'package:nilam/features/domain/entities/brand_response.dart';

class BrandB extends StatelessWidget {
  const BrandB(
      {super.key,
      required this.block,
      required this.brands,
      required this.goToSearch});

  final BlockResponse block;
  final List<BrandResponse> brands;
  final Function goToSearch;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              TextB(text: block.name!, fontColor: Colors.black, fontSize: 16),
              const Spacer(),
              const TextB(text: "show all")
            ],
          ),
          const Divider(),
          SizedBox(
            height: size.width / 2,
            width: size.width,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: brands.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = brands[index];
                  return GestureDetector(
                    onTap: () {
                      goToSearch("");
                    },
                    child: SizedBox(
                      width: size.width / 3,
                      height: size.width / 2,
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(
                                child: NetworkImageB(
                                    imageUrl: baseUrl + (item.imageUrl ?? ""))),
                            const SizedBox(height: 10),
                            TextB(text: item.brandName ?? ""),
                            const SizedBox(height: 10)
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
