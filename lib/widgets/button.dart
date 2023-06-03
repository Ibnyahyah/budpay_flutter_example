import 'dart:async';

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final Function()? onPressed;
  final String text;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed != null
          ? () {
              setState(() {
                _loading = true;
              });
              widget.onPressed!();
              Timer(const Duration(seconds: 6), () {
                setState(() {
                  _loading = false;
                });
              });
            }
          : null,
      child: !_loading
          ? Text(widget.text)
          : Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8.0),
              child: const CircularProgressIndicator(),
            ),
    );
  }
}
