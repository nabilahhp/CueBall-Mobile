class Makanan {
  final int idmakanan;
  final String nm;
  final int harga;
  final String foto;
  final String deskripsi;

  Makanan({
    required this.idmakanan,
    required this.nm,
    required this.harga,
    required this.foto,
    required this.deskripsi,
  });

  factory Makanan.fromJson(Map<String, dynamic> json) {
    return Makanan(
      idmakanan: int.parse(json['idmakanan']),
      nm: json['nm'],
      harga: int.parse(json['harga']),
      foto: json['foto'],
      deskripsi: json['deskripsi'],
    );
  }
}
