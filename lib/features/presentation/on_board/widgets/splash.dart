import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/utils/text_styles.dart';
import 'package:nilam/core/widgets/text.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(color: nGray),
      width: size.width,
      height: size.height,
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextB(
              text: "Nilam",
              textStyle: bHeadline1,
              fontColor: nWhite,
            ),
          ],
        ),
      ),
    );
  }
}
