class DoadoresEstado {
  int total;
  String estado;

  DoadoresEstado({required this.total, required this.estado});

  factory DoadoresEstado.fromJson(Map<String, dynamic> json) {
    return DoadoresEstado(
      total: json['total'],
      estado: json['estado'],
    );
  }
}