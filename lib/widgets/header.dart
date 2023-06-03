import 'package:flutter/material.dart';

class CustomTextHeader extends StatelessWidget {
  const CustomTextHeader(
    this.text, {
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
