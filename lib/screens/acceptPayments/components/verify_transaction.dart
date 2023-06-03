import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class VerifyTransaction extends StatelessWidget {
  VerifyTransaction({super.key});

  var logger = Logger();
  final TextEditingController _referenceController = TextEditingController();

  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _verifyTransaction(context, responder) {
    // verifyTransaction : check if a transaction is successful or failed.
    budPay
        .verifyTransaction(reference: ":${_referenceController.text}")
        .then((response) {
      responder(context, response.toString());
      return logger.d(response);
    }).catchError((err) => logger.e(err));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextHeader("Verify Transaction"),
        CustomInput(
          label: "Transaction Reference",
          controller: _referenceController,
        ),
        CustomButton(
          text: "Submit",
          onPressed: () {
            _verifyTransaction(context, Helper().showResponse);
          },
        )
      ],
    );
  }
}
