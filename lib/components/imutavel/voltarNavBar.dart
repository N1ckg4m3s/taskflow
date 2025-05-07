import 'package:flutter/material.dart';
import 'package:taskflow/controller/Redirecionador.dart';

class voltarNavBar extends StatelessWidget {
  const voltarNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Redirecionador().redirect_to_voltar(context),
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back, size: 30),
          Text('Voltar', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
