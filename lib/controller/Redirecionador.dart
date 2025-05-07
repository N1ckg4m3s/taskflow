// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:taskflow/pages/informacoesProjeto/informacoesProjeto.dart';

class Redirecionador {
  /* Redirecionamentos do main */
  void adicionarNovoProjeto(BuildContext context, {Function? update}) async {
    print("irPara adicionarNovoProjeto");
  }

  void relatorioDoProjeto(
    BuildContext context,
    int idProjeto, {
    Function? update,
  }) async {
    final retorno = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => informacoesProjeto(idProjeto: idProjeto),
      ),
    );
    print(retorno);
  }

  void configuracoesDoProjeto(BuildContext context, {Function? update}) async {
    print("irPara configuracoesDoProjeto");
  }

  /* Redirecionamentos do relatorioDoProjeto */
  void gastosDoProjeto(BuildContext context, {Function? update}) async {
    print("irPara gastosDoProjeto");
  }

  void historicoDeDiasDoProjeto(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara historicoDeDiasDoProjeto");
  }

  void informacoesDoDia(BuildContext context, {Function? update}) async {
    print("irPara informacoesDoDia");
  }

  /* Redirecionamentos do gastosDoProjeto */
  void novoGasto(BuildContext context, {Function? update}) async {
    print("irPara novoGasto");
  }

  void informacoesDoGasto(BuildContext context, {Function? update}) async {
    print("irPara informacoesDoGasto");
  }

  void historicoDeGastos(BuildContext context, {Function? update}) async {
    print("irPara historicoDeGastos");
  }

  void voltar(BuildContext context) async {
    Navigator.pop(context, true); // True é para resetar
  }
}
