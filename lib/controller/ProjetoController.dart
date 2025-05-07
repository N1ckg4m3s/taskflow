import 'package:taskflow/controller/Controllers%20Teste/ProjetoController.dart';
import 'package:taskflow/controller/types.dart';

class Projetocontroller {
  Future<List<Projeto>> obterTodosOsProjetos() async {
    return Projetocontroller_teste().obterTodosOsProjetos();
  }

  Future<List<DiaAgenda>> obterDiasDoProjeto(int idProjeto) async {
    return Projetocontroller_teste().obterDiasDoProjeto(idProjeto);
  }
}
