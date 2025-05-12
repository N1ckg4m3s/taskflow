import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/Botao.dart';
import 'package:taskflow/components/genericos/containerBase.dart';
import 'package:taskflow/controller/Redirecionador.dart';

class relatorioProjeto extends StatelessWidget {
  final int idProjeto;
  final Function setFiltrar;
  final Function setState;
  const relatorioProjeto({
    super.key,
    required this.idProjeto,
    required this.setFiltrar,
    required this.setState,
  });

  void handleFiltrar() {
    setFiltrar();
  }

  void handleHostoricoGastos(context) {}

  void handleHistorico(context) {
    Redirecionador().redirect_to_historicoDeDiasDoProjeto(
      context,
      idProjeto,
      update: setState,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Containerbase(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Relatório do projeto', style: TextStyle(fontSize: 25)),
            Text(
              'Nome: [teste de nome muito grande para ver o que faz]',
              style: TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
            ),
            Text('Tempo: [##] dias', style: TextStyle(fontSize: 20)),
            Text('Dias trabalhados: [##] dias', style: TextStyle(fontSize: 20)),
            Text('Folgas: [##]/##', style: TextStyle(fontSize: 20)),
            Text('Gastos: [####]\$', style: TextStyle(fontSize: 20)),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.49,
                  child: Botao(
                    color: Color(0xFFD8D8D8),
                    height: 50,
                    onClick: () => handleFiltrar(),
                    child: Text('Filtrar', style: TextStyle(fontSize: 20)),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.49,
                  child: Botao(
                    color: Color(0xFFD8D8D8),
                    height: 50,
                    onClick: () => handleHostoricoGastos(context),
                    child: Text('Gastos', style: TextStyle(fontSize: 20)),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Botao(
                    color: Color(0xFFFECA3E),
                    height: 50,
                    onClick: () => handleHistorico(context),
                    child: Text('Historico', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
