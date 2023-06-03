import 'package:flutter/material.dart';

class Helper {
  showResponse(BuildContext context, dynamic data) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Container(
          child: Text(data),
        ),
      ),
    );
  }
}
