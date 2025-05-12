class controladorauxiliar {
  String obterNomeDoMes(int numeroMes) {
    if (numeroMes == -1) return '';
    List<String> meses = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro',
    ];

    return meses[numeroMes - 1];
  }
}
