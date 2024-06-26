import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double value;

  CustomProgressIndicator({required this.value});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      backgroundColor: Colors.grey.shade200,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }
}
