import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CheckOutForm extends StatelessWidget {
  CheckOutForm({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _callbackURLController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  // creating reference variable: [OPTIONAL]
  void _standardCheckout(context, responder) {
    // standardCheckout payment with card
    String reference = DateTime.now().millisecondsSinceEpoch.toString();
    budPay
        .standardCheckout(
      payloads: CheckOut(
        email: _emailController.text, // user email
        currency: _currencyController.text
            .toUpperCase(), // currency code e.g [NGN, GHS, USD]
        reference: reference, // reference code [OPTIONAL]
        callBackURL: _callbackURLController.text, // reference code [OPTIONAL]
        amount: _amountController.text, // amount
      ),
      context: context, // required BuildContext to show popup
    )
        .then((response) {
      // responder(context, response.toString());
      return logger.d(response);
    }).catchError((error) => logger.e(error));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextHeader("Standard standardCheckout"),
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
          label: "CallBackUrl [Optional]",
          controller: _callbackURLController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _standardCheckout(context, Helper().showResponse);
            }),
      ],
    );
  }
}
