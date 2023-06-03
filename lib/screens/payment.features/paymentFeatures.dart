import 'package:example/screens/payment.features/components/createCustomer.dart';
import 'package:example/screens/payment.features/components/createVirtualAccount.dart';
import 'package:example/screens/payment.features/components/getRefunds.dart';
import 'package:example/widgets/custom_template.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'components/createPaymentLink.dart';
import 'components/createRefund.dart';
import 'components/getRefund.dart';
import 'components/getVirtualAccounts.dart';
import 'components/requestPayment.dart';

class PaymentFeaturesScreen extends StatelessWidget {
  PaymentFeaturesScreen({super.key});
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return CustomTemplate(
      navTitle: "Payment Features",
      children: [
        RequestPaymentForm(),
        const SizedBox(height: 20),
        CreatePaymentLinkForm(),
        const SizedBox(height: 20),
        CreateCustomer(),
        const SizedBox(height: 20),
        CreateVirtualAccountForm(),
        const SizedBox(height: 20),
        GetVirtualAccounts(),
        const SizedBox(height: 20),
        CreateRefund(),
        const SizedBox(height: 20),
        GetRefunds(),
        const SizedBox(height: 20),
        GetRefund(),
      ],
    );
  }
}
