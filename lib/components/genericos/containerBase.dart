import 'dart:math';

import 'package:flutter/material.dart';

class Containerbase extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Function? onClick;
  final Widget child;

  const Containerbase({
    super.key,
    this.width,
    required this.height,
    this.color,
    required this.child,
    this.onClick,
  });

  Widget conteudo(BuildContext context) {
    return Container(
      width: min(MediaQuery.of(context).size.width, 450) - 32,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (onClick != null) {
      return TextButton(onPressed: () => onClick!(), child: conteudo(context));
    }

    return conteudo(context);
  }
}
