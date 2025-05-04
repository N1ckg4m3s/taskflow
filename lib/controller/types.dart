// ignore_for_file: constant_identifier_names

enum StatusProjeto { EmAndamento, EmEspera, Concluido, Cancelado }

class Projeto {
  final int id;
  final DateTime dataInicio;
  final DateTime dataFim;
  final String nome;
  final StatusProjeto statusProjeto;

  Projeto({
    required this.id,
    required this.dataInicio,
    required this.dataFim,
    required this.nome,
    required this.statusProjeto,
  });
}
