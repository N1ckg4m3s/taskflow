import 'package:taskflow/controller/Controllers%20Teste/ProjetoController.dart';
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

class Projetocontroller {
  Future<List<Projeto>> obterTodosOsProjetos() async {
    return Projetocontroller_teste().obterTodosOsProjetos();
  }
}
