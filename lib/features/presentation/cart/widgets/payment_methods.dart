import 'package:flutter/cupertino.dart';
import 'package:nilam/core/widgets/radio_button.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key, required this.selectedPaymentMethod});

  final Function selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: RadioGroupB(
          radioValues: [
            RadioValue(name: "Cash on Delivery", value: 1),
            RadioValue(name: "Online Payment", value: 2)
          ],
          index: (value) {
            selectedPaymentMethod(value);
          },
          grid: 2),
    );
  }
}
