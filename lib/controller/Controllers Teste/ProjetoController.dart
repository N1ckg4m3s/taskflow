// ignore_for_file: non_constant_identifier_names

import 'package:taskflow/controller/types.dart';

List<Projeto> projetosTeste = [
  Projeto(
    id: 0,
    dataInicio: DateTime.now(),
    dataFim: DateTime.now(),
    nome: "Projeto Cancelado",
    statusProjeto: StatusProjeto.Cancelado,
  ),
  Projeto(
    id: 1,
    dataInicio: DateTime.now(),
    dataFim: DateTime.now(),
    nome: "Projeto Concluido",
    statusProjeto: StatusProjeto.Concluido,
  ),
  Projeto(
    id: 2,
    dataInicio: DateTime.now(),
    dataFim: DateTime.now(),
    nome: "Projeto EmAndamento",
    statusProjeto: StatusProjeto.EmAndamento,
  ),
  Projeto(
    id: 3,
    dataInicio: DateTime.now(),
    dataFim: DateTime.now(),
    nome: "Projeto EmEspera",
    statusProjeto: StatusProjeto.EmEspera,
  ),
];

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

class Projetocontroller_teste {
  List<Projeto> obterTodosOsProjetos() {
    return projetosTeste;
  }

  List<DiaAgenda> obterDiasDoProjeto(int idProjeto) {
    return dias_teste.where((d) => d.idProjeto == idProjeto).toList();
  }
}
