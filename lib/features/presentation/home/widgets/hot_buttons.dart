import 'package:flutter/cupertino.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/all_blocks_response.dart';
import 'package:nilam/features/domain/entities/hot_button_response.dart';

class HotButtonsB extends StatelessWidget {
  const HotButtonsB(
      {super.key,
      required this.block,
      required this.hotButtons,
      required this.goToSearch});

  final BlockResponse block;
  final List<HotButtonResponse> hotButtons;
  final Function goToSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: hotButtons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = hotButtons[index];
          return GestureDetector(
            onTap: (){
              goToSearch(item.link);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: const Color(0XFFE4E4E4)),
                  color: const Color(0XFFF1F4FA)),
              child: Row(
                children: [
                  NetWorkImageViewB(imageUrl: baseUrl + (item.iconPath ?? "")),
                  const SizedBox(width: 5),
                  TextB(text: item.title!, fontWeight: FontWeight.w400)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
