import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/core/widgets/text_field.dart';
import 'package:timer_count_down/timer_count_down.dart';

Future showUpdateEmail(BuildContext context,
    {required String email,
    required Function sendOtp,
    required Function submit,
    required bool otpLoading,
    required bool submitLoading}) {
  final mobileController = TextEditingController(text: email);
  final mobileFocusNode = FocusNode();
  final otpController = TextEditingController();
  final otpFocusNode = FocusNode();

  bool resend = false;

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldB(
                          focusNode: mobileFocusNode,
                          controller: mobileController,
                          onChanged: (text) {},
                          labelText: "Email"),
                    ),
                    resend
                        ? Container(
                            width: 100,
                            height: 48,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            color: Colors.green.withOpacity(.9),
                            child: Countdown(
                              seconds: 60,
                              build: (BuildContext context, double time) =>
                                  TextB(
                                text: "${time.toInt()} s",
                                fontColor: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              interval: const Duration(milliseconds: 1000),
                              onFinished: () {
                                setState(() {
                                  resend = false;
                                });
                              },
                            ),
                          )
                        : ButtonB(
                            width: 100,
                            text: "Send Otp",
                            loading: otpLoading,
                            press: () {
                              if (mobileController.text.isNotEmpty) {
                                sendOtp(mobileController.text);
                              }
                              setState(() {
                                resend = true;
                              });
                            },
                            bgColor: Colors.green,
                          )
                  ],
                ),
                const SizedBox(height: 10),
                TextFieldB(
                    focusNode: otpFocusNode,
                    controller: otpController,
                    onChanged: (text) {},
                    labelText: "OTP"),
                const SizedBox(height: 20),
                ButtonB(
                    text: 'Submit',
                    loading: submitLoading,
                    press: () {
                      if (otpController.text.isNotEmpty) {
                        submit(otpController.text, mobileController.text);
                      }
                    }),
              ],
            ),
          );
        });
      });
}
