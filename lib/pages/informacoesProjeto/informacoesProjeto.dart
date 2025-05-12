import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/iniciarPagina.dart';
import 'package:taskflow/components/imutavel/voltarNavBar.dart';
import 'package:taskflow/pages/informacoesProjeto/modules/list.dart';
import 'package:taskflow/pages/informacoesProjeto/modules/relatorio.dart';

class informacoesProjeto extends StatefulWidget {
  final int idProjeto;

  const informacoesProjeto({super.key, required this.idProjeto});

  @override
  State<informacoesProjeto> createState() => _informacoesProjetoState();
}

class _informacoesProjetoState extends State<informacoesProjeto> {
  ValueNotifier<bool> filtrar = ValueNotifier(false);

  @override
  void dispose() {
    filtrar.dispose();
    super.dispose();
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
              setFiltrar: () {
                setState(() {
                  filtrar.value = !filtrar.value;
                });
              },
              setState: () => setState(() {}),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: filtrar,
              builder: (ctx, value, child) {
                return listaDiariasProjeto(
                  idProjeto: widget.idProjeto,
                  filtrar: value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
