// ignore_for_file: constant_identifier_names
enum GeralInputType { texto, numero, dia, hora, opcoes }

enum StatusProjeto { EmAndamento, EmEspera, Concluido, Cancelado }

enum StatusDiaAgenda { NaoDefinido, Trabalhado, Folga, Atencao }

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

class DiaAgenda {
  final int id;
  final int idProjeto;
  final DateTime data;
  final StatusDiaAgenda status;

  DiaAgenda({
    required this.status,
    required this.idProjeto,
    required this.data,
    required this.id,
  });
}
