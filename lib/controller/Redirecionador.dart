// ignore_for_file: avoid_print, non_constant_identifier_names, dead_code

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
    final bool retorno = false;

    if (retorno && update != null) update();
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

    if (retorno && update != null) update();
  }

  void redirect_to_configuracoesDoProjeto(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara configuracoesDoProjeto");
    final bool retorno = false;

    if (retorno && update != null) update();
  }

  /* Redirecionamentos do relatorioDoProjeto */
  void redirect_to_gastosDoProjeto(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara gastosDoProjeto");
    final bool retorno = false;

    if (retorno && update != null) update();
  }

  void redirect_to_historicoDeDiasDoProjeto(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara historicoDeDiasDoProjeto");
    final bool retorno = false;

    if (retorno && update != null) update();
  }

  void redirect_to_informacoesDoDia(
    BuildContext context,
    DiaAgenda dia, {
    Function? update,
  }) async {
    final bool retorno = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                informacoesDoDia(idProjeto: dia.idProjeto, idDia: dia.id),
      ),
    );

    if (retorno && update != null) update();
  }

  /* Redirecionamentos do gastosDoProjeto */
  void redirect_to_novoGasto(BuildContext context, {Function? update}) async {
    print("irPara novoGasto");
    final bool retorno = false;

    if (retorno && update != null) update();
  }

  void redirect_to_informacoesDoGasto(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara informacoesDoGasto");
    final bool retorno = false;

    if (retorno && update != null) update();
  }

  void redirect_to_historicoDeGastos(
    BuildContext context, {
    Function? update,
  }) async {
    print("irPara historicoDeGastos");
    final bool retorno = false;

    if (retorno && update != null) update();
  }

  void redirect_to_voltar(BuildContext context) async {
    Navigator.pop(context, true); // True é para resetar
  }
}
