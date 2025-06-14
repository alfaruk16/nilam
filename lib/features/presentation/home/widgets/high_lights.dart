import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/all_blocks_response.dart';
import 'package:nilam/features/domain/entities/high_light_response.dart';

class HighlightsB extends StatelessWidget {
  const HighlightsB(
      {super.key,
      required this.block,
      required this.highlights,
      required this.goToSearch});

  final BlockResponse block;
  final List<HighlightResponse> highlights;
  final Function goToSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextB(
              text: block.name!,
              fontWeight: FontWeight.w400,
              fontColor: Colors.black,
              fontSize: 16),
          const Divider(),
          const SizedBox(height: 5),
          GridView.builder(
              padding: const EdgeInsets.all(0),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: highlights.length == 1 ? 1 : 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: .80),
              itemCount: highlights.length,
              itemBuilder: (BuildContext context, int index) {
                final item = highlights[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: const Color(0XFFE1E1E1)),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextB(
                          text: item.title!,
                          fontColor: const Color(0XFF202633)),
                      const SizedBox(height: 10),
                      item.highlightSectionDetailDtos!.length == 1
                          ? Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  goToSearch(item.detailsLink);
                                },
                                child: NetworkImageB(
                                    imageUrl: baseUrl +
                                        item.highlightSectionDetailDtos![0]
                                            .filePath!),
                              ),
                            )
                          : Expanded(
                              child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount:
                                      item.highlightSectionDetailDtos!.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                          childAspectRatio: 1),
                                  itemBuilder:
                                      (BuildContext context, int childIndex) {
                                    return GestureDetector(
                                      onTap: () {
                                        goToSearch(item.detailsLink);
                                      },
                                      child: NetworkImageB(
                                          imageUrl: baseUrl +
                                              item
                                                  .highlightSectionDetailDtos![
                                                      childIndex]
                                                  .filePath!),
                                    );
                                  }),
                            ),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.only(top: 10),
                        child: const TextB(
                            text: "View More", fontColor: Color(0XFF202633)),
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
