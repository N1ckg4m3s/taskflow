// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:taskflow/components/imutavel/input.dart';
import 'package:taskflow/controller/types.dart';

// Especificação se o status for Trabalhado
class Infomacao_Trabalhado extends StatelessWidget {
  final Function definirValorDoHorarioDeEntrada;
  final Function definirValorDoHorarioDeSaida;

  const Infomacao_Trabalhado({
    super.key,
    required this.definirValorDoHorarioDeEntrada,
    required this.definirValorDoHorarioDeSaida,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            GeneralInput(
              type: GeralInputType.hora,
              label: 'Horário entrada',
              onSubmit: (val) => definirValorDoHorarioDeEntrada(val),
            ),
            GeneralInput(
              type: GeralInputType.hora,
              label: 'Horário saída',
              onSubmit: (val) => definirValorDoHorarioDeSaida(val),
            ),
          ],
        ),
      ],
    );
  }
}

// Especificação se o status for Atencao
class Infomacao_Atencao extends StatelessWidget {
  const Infomacao_Atencao({super.key});
  @override
  Widget build(BuildContext context) {
    return GeneralInput(
      type: GeralInputType.texto,
      label: 'Observação',
      onSubmit: (val) => print('texto: $val'),
    );
  }
}
