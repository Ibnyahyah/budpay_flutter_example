import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.controller,
    required this.label,
  });

  final String label;
  final TextEditingController controller;

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: Colors.purple,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: _border(),
          focusedBorder: _border(),
          enabledBorder: _border(),
          errorBorder: _border(),
        ),
      ),
    );
  }
}
