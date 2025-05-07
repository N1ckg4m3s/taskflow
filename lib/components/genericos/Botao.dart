import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/containerBase.dart';

class Botao extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Function onClick;
  final Function? onHold;
  final Widget child;

  const Botao({
    super.key,
    this.width,
    this.height,
    this.color,
    required this.child,
    this.onHold,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onClick(),
      onLongPress: onHold != null ? () => onHold!() : () => {},
      child: Containerbase(
        width: width,
        height: height,
        color: color,
        child: Center(child: child),
      ),
    );
  }
}
