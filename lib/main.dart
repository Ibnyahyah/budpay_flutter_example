import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:flutter/material.dart';
import '_screens.dart';

void main() async {
  await BudpayPlugin.initialize(
          publicKey: "pk_test_jv8yueg1ycwkowviqw91swbewglvziwde9idpd",
          secretKey: "sk_test_3xd7ybrhumna6sn9kumn3eqljal6lghshb3uiu9",
          signatureKey: "")
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budpay Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
