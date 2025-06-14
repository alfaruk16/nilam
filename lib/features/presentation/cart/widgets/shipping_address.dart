import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/user_address.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key, required this.address});

  final UserAddress address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextB(text: "Name: ${address.name ?? ""}"),
          const SizedBox(height: 3),
          TextB(text: "Phone: ${address.mobile ?? ""}"),
          const SizedBox(height: 3),
          TextB(text: "Email: ${address.email ?? ""}"),
          const SizedBox(height: 3),
          TextB(text: "Address: ${address.address1 ?? ""}"),
          const SizedBox(height: 3),
          TextB(
              text:
                  "${address.districtName ?? ""}, ${address.divisionName ?? ""}"),
        ],
      ),
    );
  }
}
