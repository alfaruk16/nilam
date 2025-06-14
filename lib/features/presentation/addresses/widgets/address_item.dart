import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/user_address.dart';

class AddressItemView extends StatelessWidget {
  const AddressItemView(
      {super.key,
      required this.userAddress,
      required this.edit,
      required this.markAsDefault});

  final UserAddress userAddress;
  final Function edit;
  final Function markAsDefault;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextB(
              text: userAddress.name!,
              fontColor: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            ButtonB(
                height: 30,
                width: 60,
                text: "Edit",
                press: () {
                  edit(userAddress);
                },
                bgColor: Colors.blue)
          ],
        ),
        item("Name", userAddress.name!),
        item("Phone", userAddress.mobile!),
        item("Email", userAddress.email ?? ""),
        item("Address", userAddress.address1 ?? ""),
        const SizedBox(height: 5),
        userAddress.isDefault!
            ? const SizedBox(
                height: 35,
                child: TextB(
                  text: "Default Address",
                  fontSize: 16,
                  fontColor: buttonColor,
                ),
              )
            : ButtonB(
                height: 35,
                width: 200,
                text: "MARK AD DEFAULT",
                press: () {
                  markAsDefault(userAddress.id.toString());
                },
                bgColor: Colors.black.withOpacity(.6)),
        const SizedBox(height: 5),
        const Divider(),
        const SizedBox(height: 20)
      ],
    );
  }
}

Widget item(String title, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        SizedBox(
          width: 150,
          child: TextB(
            text: title,
            fontColor: Colors.black,
          ),
        ),
        TextB(text: ": $text")
      ],
    ),
  );
}
