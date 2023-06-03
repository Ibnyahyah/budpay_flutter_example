import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class GetAllDataPlan extends StatelessWidget {
  GetAllDataPlan({super.key});

  TextEditingController _providerController = TextEditingController();
  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _getAllInternetDataPlans(context, responder) {
    budPay
        .getAllInternetDataPlans(
            provider: _providerController.text.toUpperCase())
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
        const CustomTextHeader("Data Plan"),
        const SizedBox(height: 20),
        CustomInput(
          controller: _providerController,
          label: "Provider",
        ),
        const SizedBox(height: 20),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _getAllInternetDataPlans(context, Helper().showResponse);
            }),
      ],
    );
  }
}
