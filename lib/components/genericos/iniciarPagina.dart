// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Iniciarpagina extends StatelessWidget {
  final Widget child;
  const Iniciarpagina({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500),
        child: child,
      ),
    );
  }
}
