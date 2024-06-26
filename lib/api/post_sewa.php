<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_billiard";

// Buat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Periksa koneksi
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Ambil data dari POST request
$data = json_decode(file_get_contents('php://input'), true);
// Tampilkan data untuk memeriksanya
var_dump($data);

$iduser = $data['idUser'];
$idmeja = $data['idmeja'];
$tanggal = $data['tanggal'];
$harga = $data['harga'];
$tot = $data['tot'];
$status = $data['status'];

// Insert data ke tabel
$sql = "INSERT INTO sewa (iduser, idmeja, tgl_pesan, harga, tot, status) VALUES (?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
if ($stmt) {

  $stmt->bind_param("ssssss", $iduser, $idmeja, $tanggal, $harga, $tot, $status); // Ubah urutan tanggal dan jam
  $stmt->execute();

  $stmt->close();
  $conn->close();

  echo json_encode(["message" => "Booking Sewa successful"]);
} else {
  // Gagal menyiapkan statement, beri respon kesalahan
  http_response_code(500);
  echo json_encode(["message" => "Failed to prepare statement"]);
}
