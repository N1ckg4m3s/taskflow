import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/containerBase.dart';

class Botao extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Function onClick;
  final Widget child;

  const Botao({
    super.key,
    this.width,
    required this.height,
    this.color,
    required this.child,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Containerbase(
      width: width,
      height: height,
      color: color,
      onClick: onClick,
      child: Center(child: child),
    );
  }
}
