import 'package:flutter/material.dart';
import 'package:taskflow/components/cards/card_diaTrabalhado.dart';
import 'package:taskflow/components/genericos/construtorFuturo.dart';
import 'package:taskflow/controller/DiaAgendaController.dart';
import 'package:taskflow/controller/types.dart';

class listaDiariasProjeto extends StatefulWidget {
  final int idProjeto;
  final bool filtrar;

  const listaDiariasProjeto({
    super.key,
    required this.idProjeto,
    required this.filtrar,
  });

  @override
  State<StatefulWidget> createState() => stateListaDiariasProjeto();
}

class stateListaDiariasProjeto extends State<listaDiariasProjeto> {
  List<DiaAgenda> filtrarData(List<DiaAgenda> data) {
    if (widget.filtrar) {
      return data
          .where(
            (dia) =>
                dia.status == StatusDiaAgenda.Atencao ||
                dia.status == StatusDiaAgenda.Folga,
          )
          .toList();
    }
    return data;
  }

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
                    filtrarData(dataRetornada)
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
