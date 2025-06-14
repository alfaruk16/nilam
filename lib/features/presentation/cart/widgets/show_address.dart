import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/user_address.dart';

Future showAddress(BuildContext context,
    {required List<UserAddress> address, required Function selectedIndex}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ListView.builder(
                  itemCount: address.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectedIndex(index);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: TextB(text: address[index].title!, fontSize: 16),
                      ),
                    );
                  })),
        );
      });
}
