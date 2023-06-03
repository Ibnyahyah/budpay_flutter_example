import 'package:example/screens/payouts/components/accountValidation.dart';
import 'package:example/screens/payouts/components/singlePayout.dart';
import 'package:example/widgets/custom_template.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'components/bankList.dart';
import 'components/bankListWithCurrency.dart';
import 'components/bulkPayout.dart';
import 'components/getPayouts.dart';
import 'components/payoutFee.dart';
import 'components/verifyPayout.dart';
import 'components/walletBalance.dart';

class PayoutsScreen extends StatelessWidget {
  PayoutsScreen({super.key});
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return CustomTemplate(
      navTitle: "Payouts",
      children: [
        BankList(),
        const SizedBox(height: 20),
        BankListWithCurrency(),
        const SizedBox(height: 20),
        AccountValidation(),
        const SizedBox(height: 20),
        SinglePayout(),
        const SizedBox(height: 20),
        BulkPayout(),
        const SizedBox(height: 20),
        VerifyPayout(),
        const SizedBox(height: 20),
        GetAllPayouts(),
        const SizedBox(height: 20),
        PayoutFee(),
        const SizedBox(height: 20),
        WalletBalance(),
        const SizedBox(height: 20),
      ],
    );
  }
}
