import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RequestPaymentForm extends StatelessWidget {
  RequestPaymentForm({super.key});

  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _requestPayment(context, responder) {
    // Request Payment
    budPay
        .requestPayment(
      payloads: RequestPayment(
        description:
            _descriptionController.text, // description for the bank transfer
        recipient: _recipientController
            .text, // "toluxsys@yahoo.ca,07036218209,sam@bud.africa,08161112404",
        currency: _currencyController.text
            .toUpperCase(), // currency code e.g [NGN, GHS, USD]
        amount: _amountController.text,
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
        const CustomTextHeader("Request Payment"),
        CustomInput(
          label:
              "Recipient [e.g (toluxsys@yahoo.ca,07036218209,sam@bud.africa,08161112404)]",
          controller: _recipientController,
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
          label: "Description",
          controller: _descriptionController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _requestPayment(context, Helper().showResponse);
            }),
      ],
    );
  }
}
