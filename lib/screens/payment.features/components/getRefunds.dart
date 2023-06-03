import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class GetRefunds extends StatelessWidget {
  GetRefunds({super.key});
  var logger = Logger();

  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _getRefunds(context, responder) {
    budPay.getRefunds().then((response) {
      responder(context, response.toString());
      return logger.d(response);
    }).catchError((error) => logger.e(error));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextHeader("Get Refunds"),
        CustomButton(
          text: "Submit",
          onPressed: () {
            _getRefunds(context, Helper().showResponse);
          },
        )
      ],
    );
  }
}
