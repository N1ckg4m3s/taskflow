// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:taskflow/components/Botao.dart';
import 'package:taskflow/components/SingleLine.dart';
import 'package:taskflow/components/card_projetosAtuais.dart';
import 'package:taskflow/controller/ProjetoController.dart';
import 'package:taskflow/controller/Redirecionador.dart';
import 'package:taskflow/controller/types.dart';

class listaProjetos extends StatelessWidget {
  const listaProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    final double gap = 10;

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 179, 157, 157),
      body: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500),
        child: Center(
          child: Column(
            spacing: gap,
            children: [
              Text("Projetos atuais", style: TextStyle(fontSize: 25)),
              Botao(
                height: 45,
                width: 308,
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
      ),
    );
  }
}
