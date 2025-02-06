
class DoadorMediaIdadeTipo {
  String tipo;
  double mediaIdade;

  DoadorMediaIdadeTipo({required this.tipo, required this.mediaIdade});

  factory DoadorMediaIdadeTipo.fromJson(Map<String, dynamic> json) {
    return DoadorMediaIdadeTipo(
      tipo: json['tipo'],
      mediaIdade: json['mediaIdade'],
    );
  }
}