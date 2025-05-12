import 'package:flutter/material.dart';

class Containerbase extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Widget child;

  const Containerbase({
    super.key,
    this.width,
    this.height,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color:
              color == Colors.transparent ? Colors.transparent : Colors.black,
          width: 2,
        ),
      ),
      child: child,
    );
  }
}
