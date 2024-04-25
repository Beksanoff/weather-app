import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final Widget child;

  const CustomContainer({super.key, required this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blue[300],
      ),
      child: child,
    );
  }
}
