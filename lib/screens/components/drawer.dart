import 'package:example/screens/acceptPayments/acceptPayment.dart';
import 'package:example/screens/bill.payment/bill.payment.dart';
import 'package:example/screens/payment.features/paymentFeatures.dart';
import 'package:example/screens/payouts/payouts.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });

  final List _navItems = [
    {
      "title": "Accept Payment",
      "route": AcceptPaymentScreen(),
    },
    {
      "title": "Payment Features",
      "route": PaymentFeaturesScreen(),
    },
    {
      "title": "Payout",
      "route": PayoutsScreen(),
    },
    {
      "title": "Bills",
      "route": BillPaymentScreen(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          children:
              _navItems.map((item) => _drawerItem(context, item)).toList(),
        ),
      ),
    );
  }

  InkWell _drawerItem(BuildContext context, dynamic item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => item["route"],
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black38,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Text(
            item["title"],
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
