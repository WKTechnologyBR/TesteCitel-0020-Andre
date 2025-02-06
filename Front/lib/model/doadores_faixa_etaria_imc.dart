class DoadoresFaixaEtariaIMC {
  String faixaEtaria;
  double imcMedio;

  DoadoresFaixaEtariaIMC({required this.faixaEtaria, required this.imcMedio});

  factory DoadoresFaixaEtariaIMC.fromJson(Map<String, dynamic> json) {
    return DoadoresFaixaEtariaIMC(
      imcMedio: json['imcMedio'],
      faixaEtaria: json['faixaEtaria'],
    );
  }
}