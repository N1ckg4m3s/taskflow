import 'package:flutter/material.dart';

class Construtorfuturo<T> extends StatelessWidget {
  final Future<T>? future;
  final Widget Function(T data) builder;
  final Widget? loading;
  final Widget? error;
  final Widget? noData;

  const Construtorfuturo({
    super.key,
    required this.future,
    required this.builder,
    this.loading,
    this.error,
    this.noData,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading ?? const Text('Carregando...');
        } else if (snapshot.hasError) {
          return error ?? const Text('Ocorreu um erro.');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return noData ?? const Text('Nenhum dado encontrado.');
        } else {
          return builder(snapshot.data as T);
        }
      },
    );
  }
}
