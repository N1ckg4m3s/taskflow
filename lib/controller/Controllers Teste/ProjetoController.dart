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

List<Projeto> projetosTeste = [
  Projeto(
    id: 0,
    dataInicio: DateTime.now(),
    dataFim: DateTime.now(),
    nome: "TESTE COM NOME DE PROJETO MUITO GRANDE PARA VER FAZER OS TREZ PONTINHOS",
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

class Projetocontroller_teste {
  List<Projeto> obterTodosOsProjetos() {
    return projetosTeste;
  }
}
