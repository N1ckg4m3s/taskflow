// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:taskflow/components/cards/card_diaTrabalhado.dart';
import 'package:taskflow/components/genericos/Botao.dart';
import 'package:taskflow/components/genericos/construtorFuturo.dart';
import 'package:taskflow/components/genericos/containerBase.dart';
import 'package:taskflow/components/genericos/iniciarPagina.dart';
import 'package:taskflow/components/imutavel/voltarNavBar.dart';
import 'package:taskflow/controller/DiaAgendaController.dart';
import 'package:taskflow/controller/controladorAuxiliar.dart';

class historicoDeDias extends StatefulWidget {
  final int idProjeto;
  const historicoDeDias({super.key, required this.idProjeto});

  @override
  State<StatefulWidget> createState() => stateHistoricoDeDias();
}

class stateHistoricoDeDias extends State<historicoDeDias> {
  ValueNotifier<int> mesAtual = ValueNotifier<int>(-1);
  List<int> mesesDoProjeto = [];

  @override
  void initState() {
    super.initState();
    _carregarMeses();
  }

  Future<void> _carregarMeses() async {
    mesesDoProjeto = await DiaAgendacontroller().obterMesesDoProjeto(
      widget.idProjeto,
    );
    // Certifique-se de que o ValueNotifier será atualizado dentro de um setState
    setState(() {
      mesAtual.value = mesesDoProjeto.isNotEmpty ? mesesDoProjeto.first : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double gap = 10;
    return Iniciarpagina(
      child: Column(
        children: [
          voltarNavBar(),
          Center(
            child: Text("Histórico do projeto", style: TextStyle(fontSize: 20)),
          ),
          ValueListenableBuilder(
            valueListenable: mesAtual,
            builder: (context, mes, child) {
              if (mes == -1) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                spacing: gap,
                children: [
                  paginacaoMeses(
                    adicionar: () => {mesAtual.value += 1},
                    voltar: () => {mesAtual.value -= 1},
                    atual: mesAtual.value,
                    min: mesesDoProjeto.first,
                    max: mesesDoProjeto.last,
                  ),
                  SingleChildScrollView(
                    child: Construtorfuturo(
                      future: DiaAgendacontroller().obterDiasDoProjetoPeloMes(
                        widget.idProjeto,
                        mes,
                      ),
                      builder:
                          (data) => Column(
                            spacing: gap,
                            children:
                                data
                                    .map(
                                      (e) => cardDiaTrabalhado(
                                        dia: e,
                                        onUpdate: () => setState(() {}),
                                      ),
                                    )
                                    .toList(),
                          ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget paginacaoMeses({
  required Function adicionar,
  required Function voltar,
  required int atual,
  required int min,
  required int max,
}) {
  final Color corDoVoltar = atual == min ? Colors.grey : Colors.black;
  final Color corDoAdicionar = atual == max ? Colors.grey : Colors.black;

  return Containerbase(
    child: Row(
      spacing: 30,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Botao(
          onClick: () => atual > min ? voltar() : null, // Ação ao voltar
          color: Colors.transparent,
          child: Icon(Icons.arrow_back, size: 30, color: corDoVoltar),
        ),

        Text(
          controladorauxiliar().obterNomeDoMes(atual),
          style: TextStyle(fontSize: 25),
        ),

        Botao(
          onClick: () => atual < max ? adicionar() : null, // Ação ao adicionar
          color: Colors.transparent,
          child: Icon(Icons.arrow_forward, size: 30, color: corDoAdicionar),
        ),
      ],
    ),
  );
}
