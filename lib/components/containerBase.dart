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

  Widget conteudo() {
    return Container(
      width: width ?? 350,
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
      return ElevatedButton(onPressed: () => onClick!(), child: conteudo());
    }

    return conteudo();
  }
}
