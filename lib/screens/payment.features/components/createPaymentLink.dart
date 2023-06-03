import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CreatePaymentLinkForm extends StatelessWidget {
  CreatePaymentLinkForm({super.key});

  final TextEditingController _redirectURLController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _createPaymentLink(context, responder) {
    // create Payment Link
    budPay
        .createPaymentLink(
      payloads: CreatePaymentLink(
        description: _descriptionController.text, // description for the payment
        name: _customerNameController.text, // Customer's fullname name
        redirectURL:
            _redirectURLController.text, // "https://your_redirect_link",
        currency: _currencyController.text, // currency code e.g [NGN, GHS, USD]
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
        const CustomTextHeader("Create Payment Link"),
        CustomInput(
          label: "Custom Name",
          controller: _customerNameController,
        ),
        CustomInput(
          label: "Redirect URL",
          controller: _redirectURLController,
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
              _createPaymentLink(context, Helper().showResponse);
            }),
      ],
    );
  }
}
