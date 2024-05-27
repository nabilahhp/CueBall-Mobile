class User {
  final String idUser;
  final String email;
  final String password;
  final String hp;
  final String jenisKelamin;
  final String namaLengkap;
  final String alamat;
  final String foto;
  final String? resetTokenHash;
  final String? resetTokenExpiresAt;
  final String? accountActivationHash;

  User({
    required this.idUser,
    required this.email,
    required this.password,
    required this.hp,
    required this.jenisKelamin,
    required this.namaLengkap,
    required this.alamat,
    required this.foto,
    this.resetTokenHash,
    this.resetTokenExpiresAt,
    this.accountActivationHash,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['id_user'],
      email: json['email'],
      password: json['password'],
      hp: json['hp'],
      jenisKelamin: json['jenis_kelamin'],
      namaLengkap: json['nama_lengkap'],
      alamat: json['alamat'],
      foto: json['foto'],
      resetTokenHash: json['reset_token_hash'],
      resetTokenExpiresAt: json['reset_token_expires_at'],
      accountActivationHash: json['account_activation_hash'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'email': email,
      'password': password,
      'hp': hp,
      'jenis_kelamin': jenisKelamin,
      'nama_lengkap': namaLengkap,
      'alamat': alamat,
      'foto': foto,
      'reset_token_hash': resetTokenHash,
      'reset_token_expires_at': resetTokenExpiresAt,
      'account_activation_hash': accountActivationHash,
    };
  }
}
