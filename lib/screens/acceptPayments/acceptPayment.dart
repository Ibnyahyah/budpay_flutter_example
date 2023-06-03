import 'package:example/screens/acceptPayments/components/get_all_transction.dart';
import 'package:example/widgets/custom_template.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'components/checkout_form.dart';
import 'components/payWithBankTransfer.dart';
import 'components/verify_transaction.dart';

class AcceptPaymentScreen extends StatelessWidget {
  AcceptPaymentScreen({super.key});
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return CustomTemplate(
      navTitle: "Accept Payment",
      children: [
        CheckOutForm(),
        const SizedBox(height: 20),
        VerifyTransaction(),
        const SizedBox(height: 20),
        GetAllTransaction(),
        const SizedBox(height: 20),
        PayWithBankTransfer(),
      ],
    );
  }
}
