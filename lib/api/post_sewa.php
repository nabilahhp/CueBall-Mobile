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

$idmeja = $data['idmeja'];
$tanggal = $data['tanggal']; 
$jam = $data['jam'];
$status = $data['status'];

// Insert data ke tabel
$sql = "INSERT INTO jam_sewa (idmeja, tanggal, jam, status) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
if ($stmt) {
  foreach ($jam as $j) {
    $stmt->bind_param("ssss", $idmeja, $tanggal, $j, $status); // Ubah urutan tanggal dan jam
    $stmt->execute();
  }
  
  $stmt->close();
  $conn->close();
  
  echo json_encode(["message" => "Booking successful"]);
} else {
  // Gagal menyiapkan statement, beri respon kesalahan
  http_response_code(500);
  echo json_encode(["message" => "Failed to prepare statement"]);
}
?>
