import 'package:flutter/material.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/all_blocks_response.dart';
import 'package:nilam/features/domain/entities/banner_response.dart';
import 'package:nilam/features/presentation/home/widgets/slider.dart';

class BannerB extends StatelessWidget {
  const BannerB(
      {required this.block,
      required this.banners,
      super.key,
      required this.goToSearch});

  final BlockResponse block;
  final List<BannerResponse> banners;
  final Function goToSearch;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height * 0.2;
    final width = size.width;
    return Column(
      children: [
        if (block.name == sliderBanner)
          SliderB(slideItems: banners)
        else
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 10),
            height: height,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: banners.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = banners[index];
                return GestureDetector(
                  onTap: () {
                    goToSearch(item.link);
                  },
                  child: Container(
                    width: banners.length == 1 ? width - 30 : width * .75 - 30,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color(0XFFF1F4FA)),
                    child:
                        NetworkImageB(imageUrl: baseUrl + item.mobileImageUrl!),
                  ),
                );
              },
            ),
          )
      ],
    );
  }
}
