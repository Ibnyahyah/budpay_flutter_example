import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BankListWithCurrency extends StatelessWidget {
  BankListWithCurrency({super.key});

  final TextEditingController _currencyController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _bankListWithSpecificCurrency(context, responder) {
    budPay.bankListWithSpecificCurrency(currency: "KES").then((response) {
      responder(context, response.toString());
      return logger.d(response);
    }).catchError((error) => logger.e(error));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextHeader("Get Bank list by currency"),
        CustomInput(
          label: "Currency",
          controller: _currencyController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _bankListWithSpecificCurrency(context, Helper().showResponse);
            }),
      ],
    );
  }
}
