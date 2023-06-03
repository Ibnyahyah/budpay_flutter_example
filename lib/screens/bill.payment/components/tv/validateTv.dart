import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ValidateTv extends StatelessWidget {
  ValidateTv({super.key});

  TextEditingController _providerController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _tvValidate(context, responder) {
    budPay
        .tvValidate(
            payloads: TvProvider(
      provider: _providerController.text,
      number: _numberController.text,
    ))
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
        const CustomTextHeader("Validate Tvs"),
        const SizedBox(height: 20),
        CustomInput(
          controller: _providerController,
          label: "Provider",
        ),
        CustomInput(
          controller: _numberController,
          label: "Number",
        ),
        const SizedBox(height: 20),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _tvValidate(context, Helper().showResponse);
            }),
      ],
    );
  }
}
