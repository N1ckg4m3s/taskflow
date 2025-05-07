// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/Botao.dart';
import 'package:taskflow/controller/Redirecionador.dart';
import 'package:taskflow/controller/types.dart';

class cardDiatrabalhado extends StatelessWidget {
  final DiaAgenda dia;

  const cardDiatrabalhado({super.key, required this.dia});

  Color definirCorPeloStatus() {
    switch (dia.status) {
      case StatusDiaAgenda.Atencao:
        return Color(0xffFECA3E); // Cor para EmEspera
      case StatusDiaAgenda.Trabalhado:
        return Color(0xFFB2DBA0); // Cor para Concluido
      case StatusDiaAgenda.Folga:
        return Color(0xffFE7674); // Cor para Cancelado
      default:
        return Colors.white;
    }
  }

  String diaDaSemana() {
    switch (dia.data.weekday) {
      case 1:
        return 'Segunda-Feira';
      case 2:
        return 'Terça-Feira';
      case 3:
        return 'Quarta-Feira';
      case 4:
        return 'Quinta-Feira';
      case 5:
        return 'Sexta-Feira';
      case 6:
        return 'Sabado';
      default:
        return 'Domingo';
    }
  }

  List<Widget> obterData() {
    DateTime data = dia.data;

    String diaAgenda = data.day <= 9 ? '0${data.day}' : '${data.day}';
    String mesAgenda = data.month <= 9 ? '0${data.month}' : '${data.month}';

    String diaNome = diaDaSemana();

    return [
      Text('$diaAgenda/$mesAgenda', style: TextStyle(fontSize: 30)),
      Text(diaNome, style: TextStyle(fontSize: 20)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bool redirect =
        dia.status == StatusDiaAgenda.Atencao ||
        dia.status == StatusDiaAgenda.Trabalhado;
    return Botao(
      onClick: () => {print('change Status')},
      onHold:
          redirect
              ? () =>
                  Redirecionador().redirect_to_informacoesDoDia(context, dia)
              : null,
      color: definirCorPeloStatus(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: obterData(),
          ),
          if (dia.status == StatusDiaAgenda.Trabalhado) Text("asmlkdm"),
        ],
      ),
    );
  }
}
