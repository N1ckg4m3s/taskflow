import 'dart:math';

import 'package:flutter/material.dart';

class SingleLine extends StatelessWidget {
  const SingleLine({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = min(MediaQuery.of(context).size.width, 450);

    return SizedBox(
      height: 2,
      width: screenWidth - 32,
      child: Container(color: Colors.black),
    );
  }
}
