class DoadoresTipoReceptor {
  String tipoReceptor;
  int quantidadeDoadores;

  DoadoresTipoReceptor({required this.tipoReceptor, required this.quantidadeDoadores});

  factory DoadoresTipoReceptor.fromJson(Map<String, dynamic> json) {
    return DoadoresTipoReceptor(
      tipoReceptor: json['tipoReceptor'],
      quantidadeDoadores: json['quantidadeDoadores'],
    );
  }
}