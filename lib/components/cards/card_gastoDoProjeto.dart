import 'package:flutter/material.dart';
import 'package:taskflow/components/genericos/Botao.dart';
import 'package:taskflow/controller/GastosController.dart';
import 'package:taskflow/controller/types.dart';

class cardGastosDoProjeto extends StatefulWidget {
  final gasto gastoDoProjeto;
  final Function onUpdate;

  const cardGastosDoProjeto({
    super.key,
    required this.gastoDoProjeto,
    required this.onUpdate,
  });

  @override
  State<cardGastosDoProjeto> createState() => _CardGastosDoProjetoState();
}

class _CardGastosDoProjetoState extends State<cardGastosDoProjeto> {
  late StatusGasto _status;
  late DateTime _data;
  late String _observacao;

  @override
  void initState() {
    super.initState();
    _status = widget.gastoDoProjeto.status;
    _data = widget.gastoDoProjeto.data;
    _observacao = widget.gastoDoProjeto.observacao ?? '';
  }

  Color definirCorPeloStatus() {
    switch (_status) {
      case StatusGasto.naoContar:
        return Color(0xffFE7674);
      default:
        return Colors.white;
    }
  }

  StatusGasto mudarStatusPara() {
    switch (_status) {
      case StatusGasto.contar:
        return StatusGasto.naoContar;
      default:
        return StatusGasto.contar;
    }
  }

  void holderChangeStatus() async {
    final StatusGasto novoStatus = mudarStatusPara();
    await Gastoscontroller().mudarStatusDoGasto(
      widget.gastoDoProjeto.id,
      novoStatus,
    );
    setState(() {
      _status = novoStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Botao(
      height: 60,
      onClick: holderChangeStatus,
      onHold: () => {},
      color: definirCorPeloStatus(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${_data.day.toString().padLeft(2, '0')}/'
                '${_data.month.toString().padLeft(2, '0')} | '
                '${_diaDaSemana(_data.month)}',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                'R\$ ${widget.gastoDoProjeto.valor}',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'obs: $_observacao',
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }

  String _diaDaSemana(int weekday) {
    return ['Dom', 'Seg', 'Ter', 'Quar', 'Quin', 'Sex', 'Sáb'][weekday % 7];
  }
}
