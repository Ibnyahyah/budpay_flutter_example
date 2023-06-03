import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CreateVirtualAccountForm extends StatelessWidget {
  CreateVirtualAccountForm({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _customerIDController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _createVirtualAccount(context, responder) {
    // create Payment Link
    budPay
        .createVirtualAccount(
      payloads: Customer(
        customer: _customerIDController
            .text, // "CUS_3hqlcizuoffygev", // customer code
        email: "", // customer email [OPTIONAL]
        firstName: "", // customer firstName [OPTIONAL]
        lastName: "", // customer lastName [OPTIONAL]
        phoneNumber: "", // customer phoneNumber [OPTIONAL]
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
        const CustomTextHeader("Create Virtual Account"),
        CustomInput(
          label: "Customer ID",
          controller: _customerIDController,
        ),
        CustomInput(
          label: "Email [Optional]",
          controller: _emailController,
        ),
        CustomInput(
          label: "First Name [Optional]",
          controller: _firstNameController,
        ),
        CustomInput(
          label: "Last Name [Optional]",
          controller: _lastNameController,
        ),
        CustomInput(
          label: "Phone Number [Optional]",
          controller: _phoneNumberController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _createVirtualAccount(context, Helper().showResponse);
            }),
      ],
    );
  }
}
