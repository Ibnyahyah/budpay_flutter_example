import 'package:flutter/material.dart';

class CustomTemplate extends StatelessWidget {
  const CustomTemplate({
    super.key,
    required this.navTitle,
    required this.children,
  });

  final String navTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(navTitle),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
