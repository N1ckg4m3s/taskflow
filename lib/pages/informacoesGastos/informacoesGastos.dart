import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/iniciarPagina.dart';
import 'package:taskflow/components/imutavel/voltarNavBar.dart';
import 'package:taskflow/pages/informacoesGastos/modules/list.dart';
import 'package:taskflow/pages/informacoesGastos/modules/relatorio.dart';

class informacoesGastos extends StatefulWidget {
  final int idProjeto;

  const informacoesGastos({super.key, required this.idProjeto});

  @override
  State<informacoesGastos> createState() => _informacoesGastosState();
}

class _informacoesGastosState extends State<informacoesGastos> {
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
