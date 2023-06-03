import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SinglePayout extends StatelessWidget {
  SinglePayout({super.key});

  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _bankCodeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _narrationController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _paymentModeController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _singlePayout(context, responder) {
    budPay
        .singlePayout(
      payloads: SingleTransfer(
        accountNumber: _accountNumberController.text,
        bankCode: _bankCodeController.text,
        amount: _amountController.text,
        narration: _narrationController.text,
        bankName: _bankNameController.text,
        paymentMode: _paymentModeController.text,
        currency: _currencyController.text,
      ),
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
        const CustomTextHeader("Single Payout"),
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
        CustomInput(
          label: "Payment Mode",
          controller: _paymentModeController,
        ),
        CustomInput(
          label: "Payment Mode",
          controller: _currencyController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _singlePayout(context, Helper().showResponse);
            }),
      ],
    );
  }
}
