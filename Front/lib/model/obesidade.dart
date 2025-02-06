class Obesidade {
  String obesidadeFeminina;
  String obesidadeMasculina;

  Obesidade({required this.obesidadeFeminina, required this.obesidadeMasculina});

  factory Obesidade.fromJson(Map<String, dynamic> json) {
    return Obesidade(
      obesidadeFeminina: json['Feminino'] ?? '0',
      obesidadeMasculina: json['Masculino'] ?? '0',
    );
  }
}