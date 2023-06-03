import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AirtimeProvider extends StatelessWidget {
  AirtimeProvider({super.key});

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _airtimeProviders(context, responder) {
    budPay.airtimeProviders().then((response) {
      responder(context, response.toString());
      return logger.d(response);
    }).catchError((error) => logger.e(error));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextHeader("Airtime Provider"),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _airtimeProviders(context, Helper().showResponse);
            }),
      ],
    );
  }
}
