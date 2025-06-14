import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/text.dart';

Future showCancelReason(BuildContext context, {required Function submit}) {
  bool size = false;
  bool color = false;
  bool quality = false;
  bool orderTimeOver = false;
  bool deliveryTimeOver = false;
  bool other = false;

  List<String> list = [];

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          Widget item(bool value, String text, Function update) {
            return Row(
              children: [
                Checkbox(
                    value: value,
                    onChanged: (val) {
                      setState(() {
                        update(val);
                        if (val!) {
                          list.add(text);
                        } else {
                          list.remove(text);
                        }
                      });
                    }),
                TextB(text: text)
              ],
            );
          }

          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextB(
                    text: "Reasons you want to cancel this order",
                    fontColor: Colors.black,
                    fontSize: 16),
                item(size, "Size Issue", (val) {
                  size = val;
                }),
                item(color, "Color Issue", (val) {
                  color = val;
                }),
                item(quality, "Quality", (val) {
                  quality = val;
                }),
                item(orderTimeOver, "Order confirmation time over", (val) {
                  orderTimeOver = val;
                }),
                item(deliveryTimeOver, "Delivery time over", (val) {
                  deliveryTimeOver = val;
                }),
                item(other, "Other", (val) {
                  other = val;
                }),
                const SizedBox(height: 10),
                ButtonB(
                    text: "Submit",
                    press: () {
                      if (list.isNotEmpty) {
                        String reasons = "";
                        for (int i = 0; i < list.length; i++) {
                          reasons += list[i];
                          if (i != list.length - 1) {
                            reasons = "$reasons, ";
                          }
                        }
                        submit(reasons);
                        Navigator.pop(context);
                      }
                    })
              ],
            ),
          );
        });
      });
}
