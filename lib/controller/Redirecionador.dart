// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:taskflow/pages/informacoesProjeto/informacoesProjeto.dart';

class Redirecionador {
  /* Redirecionamentos do main */
  void adicionarNovoProjeto(BuildContext context) async {
    print("irPara adicionarNovoProjeto");
  }

  void relatorioDoProjeto(BuildContext context) async {
    final retorno = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => informacoesProjeto()),
    );
    print(retorno);
  }

  void configuracoesDoProjeto(BuildContext context) async {
    print("irPara configuracoesDoProjeto");
  }

  /* Redirecionamentos do relatorioDoProjeto */
  void gastosDoProjeto(BuildContext context) async {
    print("irPara gastosDoProjeto");
  }

  void historicoDeDiasDoProjeto(BuildContext context) async {
    print("irPara historicoDeDiasDoProjeto");
  }

  void informacoesDoDia(BuildContext context) async {
    print("irPara informacoesDoDia");
  }

  /* Redirecionamentos do gastosDoProjeto */
  void novoGasto(BuildContext context) async {
    print("irPara novoGasto");
  }

  void informacoesDoGasto(BuildContext context) async {
    print("irPara informacoesDoGasto");
  }

  void historicoDeGastos(BuildContext context) async {
    print("irPara historicoDeGastos");
  }

  void voltar(BuildContext context) async {
    print("Voltar");
  }
}
