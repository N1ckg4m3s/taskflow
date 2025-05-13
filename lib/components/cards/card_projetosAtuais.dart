import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/Botao.dart';
import 'package:taskflow/controller/types.dart';

class CardProjetosatuais extends StatelessWidget {
  final Projeto projeto;
  final Function onClick;

  const CardProjetosatuais({
    super.key,
    required this.projeto,
    required this.onClick,
  });

  String obterStatus() {
    switch (projeto.statusProjeto) {
      case StatusProjeto.EmEspera:
        return "Em Espera"; // Cor para EmEspera
      case StatusProjeto.Concluido:
        return "Concluido"; // Cor para Concluido
      case StatusProjeto.Cancelado:
        return "Cancelado"; // Cor para Cancelado
      default:
        return "Em Andamento";
    }
  }

  Color definirCorPeloStatus() {
    switch (projeto.statusProjeto) {
      case StatusProjeto.EmEspera:
        return Color(0xffFECA3E); // Cor para EmEspera
      case StatusProjeto.Concluido:
        return Color(0xFFB2DBA0); // Cor para Concluido
      case StatusProjeto.Cancelado:
        return Color(0xffFE7674); // Cor para Cancelado
      default:
        return Colors.white;
    }
  }

  String obterDataDeInicioEFim() {
    DateTime inicio = projeto.dataInicio;
    DateTime fim = projeto.dataFim;

    String diaInicio = inicio.day <= 9 ? '0${inicio.day}' : '${inicio.day}';
    String mesInicio =
        inicio.month <= 9 ? '0${inicio.month}' : '${inicio.month}';

    String diaFim = fim.day <= 9 ? '0${fim.day}' : '${fim.day}';
    String mesFim = fim.month <= 9 ? '0${fim.month}' : '${fim.month}';

    return '$diaInicio/$mesInicio || $diaFim/$mesFim';
  }

  @override
  Widget build(BuildContext context) {
    return Botao(
      onClick: onClick,
      color: definirCorPeloStatus(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(obterDataDeInicioEFim(), style: TextStyle(fontSize: 15)),
                Text(obterStatus(), style: TextStyle(fontSize: 15)),
              ],
            ),
            Text(
              projeto.nome,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
