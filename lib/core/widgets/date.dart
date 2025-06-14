import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/utils/text_styles.dart';
import 'package:nilam/core/widgets/text.dart';

class DateB extends StatelessWidget {
  const DateB({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 3),
      child: TextB(
        text: date,
        textStyle: bSubtitle1,
        fontColor: nDark,
      ),
    );
  }
}
