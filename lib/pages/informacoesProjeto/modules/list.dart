import 'package:flutter/material.dart';
import 'package:taskflow/components/cards/card_diaTrabalhado.dart';
import 'package:taskflow/components/genericos/construtorFuturo.dart';
import 'package:taskflow/controller/DiaAgendaController.dart';
import 'package:taskflow/controller/types.dart';

class listaDiariasProjeto extends StatefulWidget {
  final int idProjeto;

  const listaDiariasProjeto({super.key, required this.idProjeto});

  @override
  State<StatefulWidget> createState() => stateListaDiariasProjeto();
}

class stateListaDiariasProjeto extends State<listaDiariasProjeto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Ultimas 2 semanas', style: TextStyle(fontSize: 20)),
        Construtorfuturo<List<DiaAgenda>>(
          future: DiaAgendacontroller().obterDiasDoProjeto(widget.idProjeto),
          loading: Center(child: CircularProgressIndicator()),
          noData: Text("Não possui data"),
          builder:
              (dataRetornada) => Column(
                spacing: 5,
                children:
                    dataRetornada
                        .map(
                          (dia) => cardDiaTrabalhado(
                            dia: dia,
                            onUpdate: () => setState(() {}),
                          ),
                        )
                        .toList(),
              ),
        ),
      ],
    );
  }
}
