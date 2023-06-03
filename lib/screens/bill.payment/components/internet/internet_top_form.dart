import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class InternetTopForm extends StatelessWidget {
  InternetTopForm({super.key});

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _planIDController = TextEditingController();
  final TextEditingController _providerController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _internetTopUp(context, responder) {
    String reference = DateTime.now().millisecondsSinceEpoch.toString() * 1000;
    budPay
        .internetTopUp(
      payloads: Internet(
        provider: _providerController.text,
        number: _numberController.text,
        planID: _planIDController.text,
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
        const CustomTextHeader("Internet Top"),
        CustomInput(
          label: "Phone Number",
          controller: _numberController,
        ),
        CustomInput(
          label: "PLan Id",
          controller: _planIDController,
        ),
        CustomInput(
          label: "Provider",
          controller: _providerController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _internetTopUp(context, Helper().showResponse);
            }),
      ],
    );
  }
}
