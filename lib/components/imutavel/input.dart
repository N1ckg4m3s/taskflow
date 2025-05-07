// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:taskflow/controller/types.dart';

class GeneralInput extends StatelessWidget {
  final String label;
  final GeralInputType type;
  final List<String>? options;
  final void Function(dynamic)? onSubmit;

  const GeneralInput({
    super.key,
    required this.label,
    required this.type,
    this.options,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final focusNode = FocusNode();

    focusNode.addListener(() {
      if (!focusNode.hasFocus && onSubmit != null) {
        onSubmit!(_getValue(type, controller.text));
      }
    });

    Widget input;

    switch (type) {
      case GeralInputType.texto:
      case GeralInputType.numero:
        input = TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType:
              type == GeralInputType.numero ? TextInputType.number : null,
          onSubmitted: (_) => focusNode.unfocus(),
        );
        break;

      case GeralInputType.dia:
        input = TextField(
          controller: controller,
          focusNode: focusNode,
          readOnly: true,
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              controller.text = picked.toIso8601String().split('T').first;
              onSubmit?.call(controller.text);
            }
          },
        );
        break;

      case GeralInputType.hora:
        input = TextField(
          controller: controller,
          focusNode: focusNode,
          readOnly: true,
          onTap: () async {
            final picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              controller.text = picked.format(context);
              onSubmit?.call(controller.text);
            }
          },
        );
        break;

      case GeralInputType.opcoes:
        input = DropdownButtonFormField<String>(
          items:
              options
                  ?.map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
          onChanged: (val) => onSubmit?.call(val),
        );
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 6),
        input,
      ],
    );
  }

  dynamic _getValue(GeralInputType type, String text) {
    switch (type) {
      case GeralInputType.numero:
        return double.tryParse(text);
      default:
        return text;
    }
  }
}


/*
GeneralInput(
  type: GeralInputType.hora,
  label: 'Hora',
  onSubmit: (val) => print('Hora: $val'),
),
GeneralInput(
  type: GeralInputType.numero,
  label: 'Número',
  onSubmit: (val) => print('Número: $val'),
),
GeneralInput(
  type: GeralInputType.opcoes,
  label: 'Opções',
  options: ['Opção 1', 'Opção 2'],
  onSubmit: (val) => print('Selecionado: $val'),
),
GeneralInput(
  type: GeralInputType.texto,
  label: 'Texto',
  onSubmit: (val) => print('Texto: $val'),
),
*/