import 'package:flutter/material.dart';

class CircleProgressIndicator extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;
  final double strokeWidth;
  final double size;

  const CircleProgressIndicator({
    super.key,
    this.color = Colors.blue,
    this.backgroundColor,
    this.strokeWidth = 4.0,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: color,
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
