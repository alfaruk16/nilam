import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/core/widgets/text_field.dart';

Future showAutoBid(BuildContext context,
    {required Function submit, required bool submitLoading}) {
  final maxController = TextEditingController();
  final maxFocusNode = FocusNode();
  final perBidController = TextEditingController();
  final perBidFocusNode = FocusNode();

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            contentPadding: const EdgeInsets.only(left: 20, right: 20),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const TextB(
                    text: "How do an automatic bids work?",
                    fontColor: Colors.black,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 10),
                  const TextB(
                    text:
                        "By setting up a programmed offer, our framework will naturally put new offers for your sake each time you are outbid. You should simply enter the most extreme value you are happy to offer for a thing. Our framework will at that point continue offering for you, by the littlest conceivable increment each time, until your most extreme cost is reached.",
                    fontColor: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  TextFieldB(
                      focusNode: maxFocusNode,
                      controller: maxController,
                      onChanged: (text) {},
                      textInputType: TextInputType.number,
                      labelText: "Maximum bid price"),
                  const SizedBox(height: 10),
                  TextFieldB(
                      focusNode: perBidFocusNode,
                      controller: perBidController,
                      textInputType: TextInputType.number,
                      onChanged: (text) {},
                      labelText: "Automatic increase rate"),
                  const SizedBox(height: 20),
                  ButtonB(
                      text: 'Save automatic bid',
                      loading: submitLoading,
                      press: () {
                        if (maxController.text.isNotEmpty &&
                            perBidController.text.isNotEmpty) {
                          submit(maxController.text, perBidController.text);
                          Navigator.of(context).pop();
                        }
                      }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
      });
}
