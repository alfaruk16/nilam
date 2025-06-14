import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/text.dart';

class PickUpPoints extends StatelessWidget {
  const PickUpPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(.05),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextB(
            text: "Collect from Nilam Pick-up point ?",
            fontColor: Colors.black,
          ),
          SizedBox(height: 5),
          Row(
            children: [
              TextB(
                text: "Get Free Delivery",
                fontColor: buttonColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: buttonColor,
                size: 16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
