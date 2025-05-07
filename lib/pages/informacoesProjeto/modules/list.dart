import 'package:flutter/material.dart';
import 'package:taskflow/components/cards/card_diaTrabalhado.dart';
import 'package:taskflow/controller/ProjetoController.dart';
import 'package:taskflow/controller/types.dart';

class listaDiariasProjeto extends StatelessWidget {
  final int idProjeto;
  const listaDiariasProjeto({super.key, required this.idProjeto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Ultimas 2 semanas', style: TextStyle(fontSize: 20)),
        FutureBuilder(
          future: Projetocontroller().obterDiasDoProjeto(idProjeto),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar dados'));
            }

            List<DiaAgenda> dataRetornada = snapshot.data!;

            if (dataRetornada.isEmpty) {
              return Text('Não tem data');
            }

            return Column(
              children:
                  dataRetornada
                      .map((dia) => cardDiatrabalhado(dia: dia))
                      .toList(),
            );
          },
        ),
      ],
    );
  }
}
