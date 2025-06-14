import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';

class SliderDetailsB extends StatefulWidget {
  const SliderDetailsB({required this.slideItems, super.key});
  final List<Document> slideItems;

  @override
  State<SliderDetailsB> createState() => _SliderBState();
}

class _SliderBState extends State<SliderDetailsB> {
  int current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: widget.slideItems.map((item) {
            return SizedBox(
              width: size.width,
              height: size.width / 2,
              child: NetWorkImageViewB(
                  imageUrl: "$baseUrl${item.localPath!}/${item.uuid!}"),
            );
          }).toList(),
          options: CarouselOptions(
            height: size.width * 0.5,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 4,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.slideItems.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                    width: 20,
                    height: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: current == entry.key
                          ? nWhite
                          : nWhite.withOpacity(0.5),
                    )),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
