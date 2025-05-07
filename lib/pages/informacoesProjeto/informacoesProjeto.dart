import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/iniciarPagina.dart';
import 'package:taskflow/components/imutavel/voltarNavBar.dart';
import 'package:taskflow/pages/informacoesProjeto/modules/list.dart';
import 'package:taskflow/pages/informacoesProjeto/modules/relatorio.dart';

class informacoesProjeto extends StatelessWidget {
  final int idProjeto;

  const informacoesProjeto({super.key, required this.idProjeto});

  @override
  Widget build(BuildContext context) {
    return Iniciarpagina(
      child: SingleChildScrollView(
        child: Column(
          children: [
            voltarNavBar(),
            relatorioProjeto(idProjeto: idProjeto),
            listaDiariasProjeto(idProjeto: idProjeto),
          ],
        ),
      ),
    );
  }
}
