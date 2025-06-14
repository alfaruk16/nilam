import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/text.dart';

class DrawerItem extends StatelessWidget {
  final IconData? leftIcon;
  final String? name;
  final VoidCallback? press;
  const DrawerItem({
    Key? key,
    this.leftIcon,
    this.name = "",
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          children: [
            Icon(
              leftIcon,
              color: nGray,
              size: 25,
            ),
            const SizedBox(width: 12),
            TextB(text: name!, fontColor: nBlack),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right,
              color: nBlack,
              size: 27,
            ),
          ],
        ),
      ),
    );
  }
}
