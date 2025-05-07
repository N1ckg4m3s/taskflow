import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/Botao.dart';
import 'package:taskflow/components/genericos/construtorFuturo.dart';
import 'package:taskflow/components/genericos/containerBase.dart';
import 'package:taskflow/controller/ProjetoController.dart';
import 'package:taskflow/controller/types.dart';

class relatorioProjeto extends StatelessWidget {
  final int idProjeto;
  final int idDia;
  const relatorioProjeto({
    super.key,
    required this.idProjeto,
    required this.idDia,
  });

  String obterStatus(DiaAgenda dia) {
    switch (dia.status) {
      case StatusDiaAgenda.Atencao:
        return "Atenção";
      default:
        return "Trabalhado";
    }
  }

  String diaDaSemana(DiaAgenda dia) {
    switch (dia.data.weekday) {
      case 1:
        return 'Segunda-Feira';
      case 2:
        return 'Terça-Feira';
      case 3:
        return 'Quarta-Feira';
      case 4:
        return 'Quinta-Feira';
      case 5:
        return 'Sexta-Feira';
      case 6:
        return 'Sabado';
      default:
        return 'Domingo';
    }
  }

  Widget obterData(DiaAgenda dia) {
    DateTime data = dia.data;

    String diaAgenda = data.day <= 9 ? '0${data.day}' : '${data.day}';
    String mesAgenda = data.month <= 9 ? '0${data.month}' : '${data.month}';

    String diaNome = diaDaSemana(dia);

    return Text(
      'Data: $diaAgenda/$mesAgenda - $diaNome',
      style: TextStyle(fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Containerbase(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Construtorfuturo<DiaAgenda>(
          future: Projetocontroller().obterDia(idDia),
          loading: Center(child: CircularProgressIndicator()),
          builder:
              (dataRetotno) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Infomações do dia', style: TextStyle(fontSize: 25)),
                  obterData(dataRetotno),
                  Text(
                    'Status: ${obterStatus(dataRetotno)}',
                    style: TextStyle(fontSize: 20),
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Botao(
                      color: Color(0xFFB2DBA0),
                      height: 50,
                      onClick: () => {},
                      child: Text(
                        'Salvar informação',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
