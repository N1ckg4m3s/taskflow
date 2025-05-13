// ignore_for_file: non_constant_identifier_names

import 'package:taskflow/controller/Controllers%20Teste/GastosController.dart';
import 'package:taskflow/controller/types.dart';

class Gastoscontroller {
  Future<List<gasto>> obterGastosDoProjeto_ultimasDuasSemanas(
    int idProjeto,
  ) async {
    return Gastoscontroller_teste().obterGastosDoProjeto_ultimasDuasSemanas(
      idProjeto,
    );
  }

  Future<List<gasto>> obterGastosDoProjetoPorMes(int idProjeto, int mes) async {
    return Gastoscontroller_teste().obterGastosDoProjetoPorMes(idProjeto, mes);
  }

  Future<gasto> obterGastoPorId(int idGasto) async {
    return Gastoscontroller_teste().obterGastoPorId(idGasto);
  }

  Future<void> mudarStatusDoGasto(int idGasto, StatusGasto newStatus) async {
    Gastoscontroller_teste().mudarStatusDoGasto(idGasto, newStatus);
  }
}
