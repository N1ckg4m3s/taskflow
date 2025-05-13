// ignore_for_file: non_constant_identifier_names

import 'package:taskflow/controller/Controllers%20Teste/DiaAgendaController.dart';
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

class DiaAgendacontroller {
  Future<void> mudarStatusDoDia(int idDia, StatusDiaAgenda newStatus) async {
    await DiaAgendaController_teste().mudarStatusDoDia(idDia, newStatus);
  }

  Future<DiaAgenda> obterDia(int idDia) async {
    return DiaAgendaController_teste().obterDia(idDia);
  }

  Future<List<DiaAgenda>> obterDiasDoProjeto_ultimasDuasSemanas(int idProjeto) async {
    return DiaAgendaController_teste().obterDiasDoProjeto_ultimasDuasSemanas(idProjeto);
  }

  Future<void> salvarInfoTrabalhado(
    int idDia,
    String horarioEntrada,
    String horarioSaida,
  ) async {
    return DiaAgendaController_teste().salvarInfoTrabalhado(
      idDia,
      horarioEntrada,
      horarioSaida,
    );
  }

  Future<void> salvarInfoAtencao(int idDia, String observacao) async {
    return DiaAgendaController_teste().salvarInfoAtencao(idDia, observacao);
  }

  Future<List<DiaAgenda>> obterDiasDoProjetoPeloMes(
    int idProjeto,
    int mes,
  ) async {
    return DiaAgendaController_teste().obterDiasDoProjetoPeloMes(
      idProjeto,
      mes,
    );
  }

  Future<List<int>> obterMesesDoProjeto(int idProjeto) async {
    return DiaAgendaController_teste().obterMesesDoProjeto(idProjeto);
  }
}
