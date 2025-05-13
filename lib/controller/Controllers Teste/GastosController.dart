// ignore_for_file: non_constant_identifier_names

import 'package:taskflow/controller/types.dart';

List<gasto> gastos_teste = [
  gasto(
    id: 0,
    status: StatusGasto.contar,
    idProjeto: 1,
    data: DateTime(2025, 5, 6),
    valor: 0,
  ),
  gasto(
    id: 1,
    status: StatusGasto.contar,
    idProjeto: 2,
    data: DateTime(2025, 5, 7),
    valor: 0,
  ),
  gasto(
    id: 2,
    status: StatusGasto.contar,
    idProjeto: 2,
    data: DateTime(2025, 5, 8),
    valor: 0,
  ),
  gasto(
    id: 3,
    status: StatusGasto.contar,
    idProjeto: 3,
    data: DateTime(2025, 5, 9),
    valor: 0,
  ),
  gasto(
    id: 4,
    status: StatusGasto.contar,
    idProjeto: 2,
    data: DateTime(2025, 5, 7),
    valor: 0,
  ),
  gasto(
    id: 5,
    status: StatusGasto.contar,
    idProjeto: 2,
    data: DateTime(2025, 5, 7),
    valor: 0,
  ),
  gasto(
    id: 6,
    status: StatusGasto.contar,
    idProjeto: 2,
    data: DateTime(2025, 5, 7),
    valor: 0,
  ),
];

class Gastoscontroller_teste {
  Future<List<gasto>> obterGastosDoProjeto_ultimasDuasSemanas(
    int idProjeto,
  ) async {
    final hoje = DateTime.now();
    final duasSemanasAtras = hoje.subtract(Duration(days: 14));

    return gastos_teste
        .where(
          (d) =>
              d.idProjeto == idProjeto &&
              d.data.isAfter(duasSemanasAtras) &&
              d.data.isBefore(hoje.add(Duration(days: 1))),
        )
        .toList();
  }

  Future<List<gasto>> obterGastosDoProjetoPorMes(int idProjeto, int mes) async {
    return gastos_teste
        .where((dia) => (dia.idProjeto == idProjeto && dia.data.month == mes))
        .toList();
  }

  Future<gasto> obterGastoPorId(int idGasto) async {
    return gastos_teste.firstWhere((g) => g.id == idGasto);
  }

  Future<void> mudarStatusDoGasto(int idGasto, StatusGasto newStatus) async {
    final gasto gastoAchado = await obterGastoPorId(idGasto);

    gastoAchado.status = newStatus;
  }
}
