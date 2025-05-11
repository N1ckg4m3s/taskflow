import 'package:flutter/material.dart';
import 'package:taskflow/components/cards/card_diaTrabalhado.dart';
import 'package:taskflow/components/genericos/construtorFuturo.dart';
import 'package:taskflow/controller/DiaAgendaController.dart';
import 'package:taskflow/controller/types.dart';

class listaDiariasProjeto extends StatelessWidget {
  final int idProjeto;
  const listaDiariasProjeto({super.key, required this.idProjeto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Ultimas 2 semanas', style: TextStyle(fontSize: 20)),
        Construtorfuturo<List<DiaAgenda>>(
          future: DiaAgendacontroller().obterDiasDoProjeto(idProjeto),
          loading: Center(child: CircularProgressIndicator()),
          noData: Text("Não possui data"),
          builder:
              (dataRetornada) => Column(
                spacing: 5,
                children:
                    dataRetornada
                        .map((dia) => cardDiaTrabalhado(dia: dia))
                        .toList(),
              ),
        ),
      ],
    );
  }
}
