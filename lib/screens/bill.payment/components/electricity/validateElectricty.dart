import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ValidateElectricity extends StatelessWidget {
  ValidateElectricity({super.key});

  TextEditingController _providerController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _validateElectricity(context, responder) {
    budPay
        .validateElectricity(
      payloads: ElectricityProvider(
        provider: _providerController.text,
        number: _numberController.text,
        type: _numberController.text,
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
        const CustomTextHeader("Validate Electricity"),
        const SizedBox(height: 20),
        CustomInput(
          controller: _providerController,
          label: "Provider",
        ),
        CustomInput(
          controller: _numberController,
          label: "Number",
        ),
        CustomInput(
          controller: _typeController,
          label: "Type",
        ),
        const SizedBox(height: 20),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _validateElectricity(context, Helper().showResponse);
            }),
      ],
    );
  }
}
