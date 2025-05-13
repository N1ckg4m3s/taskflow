// ignore_for_file: non_constant_identifier_names
import 'package:taskflow/controller/types.dart';

StatusDiaAgenda qualChange(StatusDiaAgenda atual) {
  switch (atual) {
    case StatusDiaAgenda.NaoDefinido:
      return StatusDiaAgenda.Trabalhado;
    case StatusDiaAgenda.Trabalhado:
      return StatusDiaAgenda.Folga;
    case StatusDiaAgenda.Folga:
      return StatusDiaAgenda.Atencao;
    case StatusDiaAgenda.Atencao:
      return StatusDiaAgenda.NaoDefinido;
  }
}

List<DiaAgenda> dias_teste = [
  DiaAgenda(
    id: 0,
    status: StatusDiaAgenda.NaoDefinido,
    idProjeto: 1,
    data: DateTime(2025, 5, 6),
  ),
  DiaAgenda(
    id: 1,
    status: StatusDiaAgenda.NaoDefinido,
    idProjeto: 2,
    data: DateTime(2025, 5, 7),
  ),
  DiaAgenda(
    id: 2,
    status: StatusDiaAgenda.NaoDefinido,
    idProjeto: 2,
    data: DateTime(2025, 5, 8),
  ),
  DiaAgenda(
    id: 3,
    status: StatusDiaAgenda.NaoDefinido,
    idProjeto: 3,
    data: DateTime(2025, 5, 9),
  ),
  DiaAgenda(
    id: 4,
    status: StatusDiaAgenda.Atencao,
    idProjeto: 2,
    data: DateTime(2025, 5, 7),
  ),
  DiaAgenda(
    id: 5,
    status: StatusDiaAgenda.Folga,
    idProjeto: 2,
    data: DateTime(2025, 5, 7),
  ),
  DiaAgenda(
    id: 6,
    status: StatusDiaAgenda.Trabalhado,
    idProjeto: 2,
    data: DateTime(2025, 5, 7),
  ),
];

class DiaAgendaController_teste {
  List<DiaAgenda> obterDiasDoProjeto_ultimasDuasSemanas(int idProjeto) {
    final hoje = DateTime.now();
    final duasSemanasAtras = hoje.subtract(Duration(days: 14));

    return dias_teste
        .where(
          (d) =>
              d.idProjeto == idProjeto &&
              d.data.isAfter(duasSemanasAtras) &&
              d.data.isBefore(hoje.add(Duration(days: 1))),
        )
        .toList();
  }

  Future<DiaAgenda> obterDia(int idDia) async {
    return dias_teste.firstWhere((d) => d.id == idDia);
  }

  Future<void> mudarStatusDoDia(int idDia, StatusDiaAgenda newStatus) async {
    final DiaAgenda diaAchado = await obterDia(idDia);

    diaAchado.status = newStatus;
  }

  Future<void> salvarInfoTrabalhado(
    int idDia,
    String horarioEntrada,
    String horarioSaida,
  ) async {
    final DiaAgenda diaAchado = await obterDia(idDia);

    diaAchado.horarioEntrada = horarioEntrada;
    diaAchado.horarioSaida = horarioSaida;
  }

  Future<void> salvarInfoAtencao(int idDia, String observacao) async {
    final DiaAgenda diaAchado = await obterDia(idDia);
    diaAchado.observacaoAtencao = observacao;
  }

  Future<List<DiaAgenda>> obterDiasDoProjetoPeloMes(
    int idProjeto,
    int mes,
  ) async {
    return dias_teste
        .where((dia) => (dia.idProjeto == idProjeto && dia.data.month == mes))
        .toList();
  }

  Future<List<int>> obterMesesDoProjeto(int idProjeto) async {
    List<DiaAgenda> diasDoProjeto =
        dias_teste.where((dia) => dia.idProjeto == idProjeto).toList();

    List<int> meses = diasDoProjeto.map((dia) => dia.data.month).toList();

    List<int> mesesUnicos = meses.toSet().toList();

    return mesesUnicos;
  }
}
