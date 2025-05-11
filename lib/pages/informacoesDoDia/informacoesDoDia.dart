// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/construtorFuturo.dart';
import 'package:taskflow/components/genericos/iniciarPagina.dart';
import 'package:taskflow/components/imutavel/voltarNavBar.dart';
import 'package:taskflow/controller/DiaAgendaController.dart';
import 'package:taskflow/controller/types.dart';
import 'package:taskflow/pages/informacoesDoDia/modules/infomacaoDoStatus.dart';
import 'package:taskflow/pages/informacoesDoDia/modules/relatorioDoDia.dart';

class informacoesDoDia extends StatefulWidget {
  final int idProjeto;
  final int idDia;

  const informacoesDoDia({
    super.key,
    required this.idProjeto,
    required this.idDia,
  });

  @override
  State<informacoesDoDia> createState() => _InformacoesDoDiaState();
}

class _InformacoesDoDiaState extends State<informacoesDoDia> {
  String horarioEntrada = '';
  String horarioSaida = '';
  String observacao = '';
  StatusDiaAgenda statusDia = StatusDiaAgenda.NaoDefinido;

  bool validarHorarios() {
    if (horarioEntrada.isEmpty) return false;
    if (horarioSaida.isEmpty) return false;

    return true;
  }

  void onSubmit() {
    if (statusDia == StatusDiaAgenda.Atencao) {
      if (observacao.isNotEmpty) {
        DiaAgendacontroller().salvarInfoAtencao(widget.idDia, observacao);
      }
    } else if (statusDia == StatusDiaAgenda.Trabalhado) {
      if (validarHorarios()) {
        DiaAgendacontroller().salvarInfoTrabalhado(
          widget.idDia,
          horarioEntrada,
          horarioSaida,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Iniciarpagina(
      child: SingleChildScrollView(
        child: Column(
          children: [
            voltarNavBar(),
            relatorioProjeto(
              idProjeto: widget.idProjeto,
              idDia: widget.idDia,
              onSubmit: () => onSubmit(),
            ),
            Construtorfuturo<DiaAgenda>(
              future: DiaAgendacontroller().obterDia(widget.idDia),
              builder: (DiaAgenda dataRetornada) {
                switch (dataRetornada.status) {
                  case StatusDiaAgenda.Atencao:
                    statusDia = StatusDiaAgenda.Atencao;
                    return Infomacao_Atencao();
                  case StatusDiaAgenda.Trabalhado:
                    statusDia = StatusDiaAgenda.Trabalhado;
                    return Infomacao_Trabalhado(
                      definirValorDoHorarioDeEntrada:
                          (val) => {horarioEntrada = val},
                      definirValorDoHorarioDeSaida:
                          (val) => {horarioSaida = val},
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
