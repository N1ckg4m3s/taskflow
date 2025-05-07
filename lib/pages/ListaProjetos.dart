// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/Botao.dart';
import 'package:taskflow/components/imutavel/SingleLine.dart';
import 'package:taskflow/components/especificos/card_projetosAtuais.dart';
import 'package:taskflow/components/genericos/iniciarPagina.dart';
import 'package:taskflow/controller/ProjetoController.dart';
import 'package:taskflow/controller/Redirecionador.dart';
import 'package:taskflow/controller/types.dart';

class listaProjetos extends StatelessWidget {
  const listaProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    final double gap = 10;

    return Iniciarpagina(
      child: Center(
        child: Column(
          spacing: gap,
          children: [
            Text("Projetos atuais", style: TextStyle(fontSize: 25)),
            Botao(
              // width: screenWidth - 32,
              height: 45,
              color: Color(0xFFD8D8D8),
              onClick: () => Redirecionador().adicionarNovoProjeto(context),
              child: Center(
                child: Text(
                  "Adicionar novo projeto",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SingleLine(),
            SingleChildScrollView(
              child: FutureBuilder(
                future: Projetocontroller().obterTodosOsProjetos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  List<Projeto>? projetos = snapshot.data;

                  if (projetos == null || projetos.isEmpty) {
                    return Text("Sem projetos");
                  }

                  return Column(
                    spacing: gap,
                    children:
                        projetos
                            .map(
                              (proj) => CardProjetosatuais(
                                projeto: proj,
                                onClick:
                                    () => Redirecionador().relatorioDoProjeto(
                                      context,
                                      proj.id,
                                    ),
                              ),
                            )
                            .toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
