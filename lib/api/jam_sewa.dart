class JamSewa {
  final String idmeja;
  final String tanggal;
  final String jam;
  final String status;

  JamSewa({
    required this.idmeja,
    required this.tanggal,
    required this.jam,
    required this.status,
  });

  factory JamSewa.fromJson(Map<String, dynamic> json) {
    // Memperoleh nilai tanggal dari JSON
    String rawDate = json['tanggal'];

    // Mengonversi tanggal menjadi format ymd
    String formattedDate = rawDate.split(" ")[0]; // Mengambil bagian tanggal saja

    // Mengembalikan instance JamSewa dengan tanggal yang diubah formatnya
    return JamSewa(
      idmeja: json['idmeja'],
      tanggal: formattedDate,
      jam: json['jam'],
      status: json['status'],
    );
  }
}
