import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/Botao.dart';
import 'package:taskflow/controller/DiaAgendaController.dart';
import 'package:taskflow/controller/Redirecionador.dart';
import 'package:taskflow/controller/types.dart';

class cardDiaTrabalhado extends StatefulWidget {
  final DiaAgenda dia;
  final Function onUpdate;

  const cardDiaTrabalhado({
    super.key,
    required this.dia,
    required this.onUpdate,
  });

  @override
  State<cardDiaTrabalhado> createState() => _CardDiaTrabalhadoState();
}

class _CardDiaTrabalhadoState extends State<cardDiaTrabalhado> {
  late StatusDiaAgenda _status;
  late String _horarioEntrada;
  late String _horarioSaida;

  @override
  void initState() {
    super.initState();
    _status = widget.dia.status;
    _horarioEntrada = widget.dia.horarioEntrada ?? '##';
    _horarioSaida = widget.dia.horarioSaida ?? '##';
  }

  Color definirCorPeloStatus() {
    switch (_status) {
      case StatusDiaAgenda.Atencao:
        return Color(0xffFECA3E);
      case StatusDiaAgenda.Trabalhado:
        return Color(0xFFB2DBA0);
      case StatusDiaAgenda.Folga:
        return Color(0xffFE7674);
      default:
        return Colors.white;
    }
  }

  StatusDiaAgenda mudarStatusPara() {
    switch (_status) {
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

  void holderChangeStatus() async {
    final novoStatus = mudarStatusPara();
    await DiaAgendacontroller().mudarStatusDoDia(widget.dia.id, novoStatus);
    setState(() {
      _status = novoStatus;
    });
  }

  String obterHorarioEntradaSaida() => '$_horarioEntrada / $_horarioSaida';

  @override
  Widget build(BuildContext context) {
    final bool redirect =
        _status == StatusDiaAgenda.Atencao ||
        _status == StatusDiaAgenda.Trabalhado;

    return Botao(
      height: 60,
      onClick: holderChangeStatus,
      onHold:
          redirect
              ? () => Redirecionador().redirect_to_informacoesDoDia(
                context,
                widget.dia,
                update: widget.onUpdate,
              )
              : null,
      color: definirCorPeloStatus(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${widget.dia.data.day.toString().padLeft(2, '0')}/'
                '${widget.dia.data.month.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                _diaDaSemana(widget.dia.data.weekday),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          if (_status == StatusDiaAgenda.Trabalhado)
            Text(obterHorarioEntradaSaida()),
        ],
      ),
    );
  }

  String _diaDaSemana(int weekday) {
    return [
      'Domingo',
      'Segunda-Feira',
      'Terça-Feira',
      'Quarta-Feira',
      'Quinta-Feira',
      'Sexta-Feira',
      'Sábado',
    ][weekday % 7];
  }
}
