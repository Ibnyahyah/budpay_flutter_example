import 'package:example/widgets/button.dart';
import 'package:flutter/material.dart';

import 'components/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budpay Flutter"),
      ),
      drawer: CustomDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "An Example application of Budpay_Flutter, the application is to demonstrate how to use budpay flutter package in your flutter application. It's also showcase how easy is to use this package in your future project for payment integration."),
            SizedBox(height: 20),
            Text(
              "NOTE: THIS APPLICATION IS USEFUL FOR TESTING ONLY DON'T USE WITH ANY REAL DATA",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "For more information, see the documentation at https://devs.budpay.com/",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(text: "Proceed to testing"),
          ],
        ),
      ),
    );
  }
}
