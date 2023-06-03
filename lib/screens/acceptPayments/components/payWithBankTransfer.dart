import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PayWithBankTransfer extends StatelessWidget {
  PayWithBankTransfer({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _payWithBankTransfer(context, responder) {
    String reference = '${DateTime.now().millisecondsSinceEpoch * 10000}';
    // pay with bank transfer
    logger.v(reference);
    budPay
        .payWithBankTransfer(
      payloads: BankTransfer(
        email: _emailController.text,
        fullName: _fullNameController.text,
        currency: _currencyController.text
            .toLowerCase(), // currency code e.g [NGN, GHS, USD]
        amount: _amountController.text,
        reference: reference,
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
        const CustomTextHeader("Pay With Bank Transfer"),
        CustomInput(
          label: "Email",
          controller: _emailController,
        ),
        CustomInput(
          label: "Amount",
          controller: _amountController,
        ),
        CustomInput(
          label: "Currency",
          controller: _currencyController,
        ),
        CustomInput(
          label: "FullName",
          controller: _fullNameController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _payWithBankTransfer(context, Helper().showResponse);
            }),
      ],
    );
  }
}
