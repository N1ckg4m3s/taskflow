// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:taskflow/controller/types.dart';
import 'package:taskflow/pages/informacoesDoDia/informacoesDoDia.dart';
import 'package:taskflow/pages/informacoesProjeto/informacoesProjeto.dart';

class Redirecionador {
  /* Redirecionamentos do main */
  void redirect_to_adicionarNovoProjeto(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara adicionarNovoProjeto");
  }

  void redirect_to_relatorioDoProjeto(
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

  void redirect_to_configuracoesDoProjeto(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara configuracoesDoProjeto");
  }

  /* Redirecionamentos do relatorioDoProjeto */
  void redirect_to_gastosDoProjeto(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara gastosDoProjeto");
  }

  void redirect_to_historicoDeDiasDoProjeto(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara historicoDeDiasDoProjeto");
  }

  void redirect_to_informacoesDoDia(
    BuildContext context,
    DiaAgenda dia, {
    Function? update,
  }) async {
    final retorno = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => informacoesDoDia(idProjeto: dia.idProjeto, idDia: dia.id),
      ),
    );
    print(retorno);
  }

  /* Redirecionamentos do gastosDoProjeto */
  void redirect_to_novoGasto(BuildContext context, {Function? update}) async {
    print("irPara novoGasto");
  }

  void redirect_to_informacoesDoGasto(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara informacoesDoGasto");
  }

  void redirect_to_historicoDeGastos(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara historicoDeGastos");
  }

  void redirect_to_voltar(BuildContext context) async {
    Navigator.pop(context, true); // True é para resetar
  }
}
