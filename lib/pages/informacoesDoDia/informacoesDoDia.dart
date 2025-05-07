import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/construtorFuturo.dart';
import 'package:taskflow/components/genericos/iniciarPagina.dart';
import 'package:taskflow/components/imutavel/voltarNavBar.dart';
import 'package:taskflow/controller/ProjetoController.dart';
import 'package:taskflow/controller/types.dart';
import 'package:taskflow/pages/informacoesDoDia/modules/infomacaoDoStatus.dart';
import 'package:taskflow/pages/informacoesDoDia/modules/relatorioDoDia.dart';

class informacoesDoDia extends StatelessWidget {
  final int idProjeto;
  final int idDia;

  const informacoesDoDia({
    super.key,
    required this.idProjeto,
    required this.idDia,
  });

  @override
  Widget build(BuildContext context) {
    return Iniciarpagina(
      child: SingleChildScrollView(
        child: Column(
          children: [
            voltarNavBar(),
            relatorioProjeto(idProjeto: idProjeto, idDia: idDia),
            Construtorfuturo<DiaAgenda>(
              future: Projetocontroller().obterDia(idDia),
              builder: (DiaAgenda dataRetornada) {
                switch (dataRetornada.status) {
                  case (StatusDiaAgenda.Atencao):
                    return Infomacao_Atencao();
                  case StatusDiaAgenda.Trabalhado:
                    return Infomacao_Trabalhado();
                  default:
                    return Text('');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
