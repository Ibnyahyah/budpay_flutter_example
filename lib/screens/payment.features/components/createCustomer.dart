import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:example/helper.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/header.dart';
import 'package:example/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CreateCustomer extends StatelessWidget {
  CreateCustomer({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  var logger = Logger();
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  void _createCustomer(context, responder) {
    // create Payment Link
    budPay
        .createCustomer(
      payloads: Customer(
        email: _emailController.text, // customer email
        firstName: _firstNameController.text, // customer firstName
        lastName: _lastNameController.text, // customer lastName
        phoneNumber: _phoneNumberController.text, // customer phoneNumber
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
        const CustomTextHeader("Create Customer"),
        CustomInput(
          label: "Email",
          controller: _emailController,
        ),
        CustomInput(
          label: "First Name",
          controller: _firstNameController,
        ),
        CustomInput(
          label: "Last Name",
          controller: _lastNameController,
        ),
        CustomInput(
          label: "Phone Number",
          controller: _phoneNumberController,
        ),
        CustomButton(
            text: "Submit",
            onPressed: () {
              _createCustomer(context, Helper().showResponse);
            }),
      ],
    );
  }
}
