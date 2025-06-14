import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/user_address.dart';

class PickUpPoint extends StatelessWidget {
  const PickUpPoint({super.key, required this.address, required this.change});

  final UserAddress address;
  final Function change;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Container(
            color: Colors.green,
            padding: const EdgeInsets.all(5),
            child: TextB(
              text: address.name!,
              fontColor: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          TextB(
            text: address.address1!,
            fontColor: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 5),
          TextB(
            text: address.districtName!,
            fontColor: Colors.green,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 8),
          GestureDetector(
              onTap: () {
                change();
              },
              child: const TextB(
                text: "Change Pickup point >",
                fontColor: buttonColor,
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    );
  }
}
