import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'text.dart';

class ButtonB extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color bgColor, borderColor;
  final double? height;
  final double? width;
  final bool? shadow;
  final double? fontSize;
  final VoidCallback press;
  final bool loading;
  final FontWeight fontWeight;
  final double? horizontalPadding;
  final double? verticalPadding;

  const ButtonB(
      {Key? key,
      required this.text,
      this.textColor = nWhite,
      this.bgColor = buttonColor,
      this.borderColor = Colors.transparent,
      this.height = 45,
      this.width,
      this.shadow = false,
      required this.press,
      this.fontSize = 17,
      this.fontWeight = FontWeight.w500,
      this.loading = false,
      this.horizontalPadding,
      this.verticalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: SizedBox(
        width: width ?? size.width,
        child: InkWell(
          onTap: press,
          child: Ink(
            height: height,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 10),
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(color: borderColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: TextB(
                    text: text!,
                    fontColor: textColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    maxLines: 1,
                  ),
                ),
                if (loading) const SizedBox(width: 10),
                if (loading)
                  SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                          color: textColor, strokeWidth: 2.5))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
