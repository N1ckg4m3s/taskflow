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

  void handleAdicionar(context) {
    Redirecionador().redirect_to_adicionarNovoGasto(context, update: setState);
  }

  void handleHistorico(context) {
    Redirecionador().redirect_to_historicoDeGastos(
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
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('Gastos no projeto', style: TextStyle(fontSize: 25)),
            ),

            Botao(
              color: Color(0xFFB2DBA0),
              height: 50,
              onClick: () => handleAdicionar(context),
              child: Text('Adicionar Gastos', style: TextStyle(fontSize: 20)),
            ),
            Botao(
              color: Color(0xFFD8D8D8),
              height: 50,
              onClick: () => handleFiltrar(),
              child: Text('Filtrar', style: TextStyle(fontSize: 20)),
            ),
            Botao(
              color: Color(0xFFFECA3E),
              height: 50,
              onClick: () => handleHistorico(context),
              child: Text('Historico', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
