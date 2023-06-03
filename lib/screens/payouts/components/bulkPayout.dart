import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BulkPayout extends StatelessWidget {
  BulkPayout({super.key});

  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _bankCodeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _narrationController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _bulkPayout(context, responder) {
    budPay
        .bulkPayout(
      payloads: BulkTransfer.fromJson({
        "currency": "NGN",
        "transfers": [
          {
            "amount": _amountController.text,
            "bank_code": _bankCodeController.text,
            "bank_name": _bankNameController.text,
            "account_number": _accountNumberController.text,
            "narration": _narrationController.text
          },
        ]
      }),
    )
        .then((response) {
      responder(context, response.toString());
      return logger.d(response);
    }).catchError((error) => logger.e(error));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextHeader("Bulk Payout"),
        CustomInput(
          label: "Account Number",
          controller: _accountNumberController,
        ),
        CustomInput(
          label: "Bank Code",
          controller: _bankCodeController,
        ),
        CustomInput(
          label: "Amount",
          controller: _amountController,
        ),
        CustomInput(
          label: "Transaction Narration",
          controller: _narrationController,
        ),
        CustomInput(
          label: "Bank Name",
          controller: _bankNameController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _bulkPayout(context, Helper().showResponse);
            }),
      ],
    );
  }
}
