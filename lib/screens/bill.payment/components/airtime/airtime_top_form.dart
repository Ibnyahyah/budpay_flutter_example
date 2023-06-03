import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AirtimeTopForm extends StatelessWidget {
  AirtimeTopForm({super.key});

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _providerController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _airtimeTopUp(context, responder) {
    String reference = DateTime.now().millisecondsSinceEpoch.toString() * 1000;
    budPay
        .airtimeTopUp(
      payload: Airtime(
        provider: _providerController.text,
        number: _numberController.text,
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
        const CustomTextHeader("Airtime Top"),
        CustomInput(
          label: "Phone Number",
          controller: _numberController,
        ),
        CustomInput(
          label: "Amount",
          controller: _amountController,
        ),
        CustomInput(
          label: "Provider",
          controller: _providerController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _airtimeTopUp(context, Helper().showResponse);
            }),
      ],
    );
  }
}
