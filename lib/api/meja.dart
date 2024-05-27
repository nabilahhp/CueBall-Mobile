class Meja {
  final String idmeja;
  final String nm;
  final String ket;
  final String harga;
  final String foto;

  Meja({
    required this.idmeja,
    required this.nm,
    required this.ket,
    required this.harga,
    required this.foto,
  });

  factory Meja.fromJson(Map<String, dynamic> json) {
    return Meja(
      idmeja: json['idmeja'],
      nm: json['nm'],
      ket: json['ket'],
      harga: json['harga'],
      foto: json['foto'],
    );
  }
}