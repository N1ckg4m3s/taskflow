// ignore_for_file: non_constant_identifier_names

import 'package:taskflow/controller/types.dart';

List<Projeto> ProjetosTeste = [
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

class Projetocontroller_teste {
  Future<List<Projeto>> obterTodosOsProjetos() async {
    return ProjetosTeste;
  }
}
