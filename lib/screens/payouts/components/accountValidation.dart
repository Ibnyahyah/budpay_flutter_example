import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AccountValidation extends StatelessWidget {
  AccountValidation({super.key});

  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _bankCodeController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _accountNameValidation(context, responder) {
    budPay
        .accountNameValidation(
      payloads: Account(
        accountNumber: _accountNumberController.text,
        bankCode: _bankCodeController.text,
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
        const CustomTextHeader("Account Validation"),
        CustomInput(
          label: "Account Number",
          controller: _accountNumberController,
        ),
        CustomInput(
          label: "Bank Code",
          controller: _bankCodeController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _accountNameValidation(context, Helper().showResponse);
            }),
      ],
    );
  }
}
