import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CreateRefund extends StatelessWidget {
  CreateRefund({super.key});
  var logger = Logger();

  TextEditingController _referenceController = TextEditingController();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _createRefund(context, responder) {
    budPay
        .createRefund(payloads: Refund(reference: "BUD_4503320239329292929"))
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
        const CustomTextHeader("Create Refund"),
        CustomInput(
          label: "Customer ID",
          controller: _referenceController,
        ),
        CustomButton(
          text: "Submit",
          onPressed: () {
            _createRefund(context, Helper().showResponse);
          },
        )
      ],
    );
  }
}
