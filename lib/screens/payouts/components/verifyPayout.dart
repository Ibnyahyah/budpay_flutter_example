import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class VerifyPayout extends StatelessWidget {
  VerifyPayout({super.key});

  final TextEditingController _refernceController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _verifyPayout(context, responder) {
    budPay.verifyPayout(reference: "trf_11044f068j1604").then((response) {
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
          controller: _refernceController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _verifyPayout(context, Helper().showResponse);
            }),
      ],
    );
  }
}
