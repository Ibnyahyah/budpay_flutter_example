import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RechargeElectricity extends StatelessWidget {
  RechargeElectricity({super.key});

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _providerController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _electricityRecharge(context, responder) {
    String reference = DateTime.now().millisecondsSinceEpoch.toString() * 1000;
    budPay
        .electricityRecharge(
      payloads: ElectricityProvider(
        provider: _providerController.text,
        number: _numberController.text,
        type: _typeController.text,
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
        const CustomTextHeader("Electricity Recharge"),
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
              _electricityRecharge(context, Helper().showResponse);
            }),
      ],
    );
  }
}
