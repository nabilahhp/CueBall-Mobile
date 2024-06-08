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

$idmeja = $data['idmeja'];
$iduser = $data['idUser'];
$tanggal = $data['tanggal']; 
$jam = $data['jam'];
$status1 = $data['status1'];
$harga = $data['harga'];
$tot = $data['tot'];
$status2 = $data['status2'];

// Sisipkan data ke tabel sewa
$sql_sewa = "INSERT INTO sewa (idmeja, iduser, tgl_pesan, harga, tot, status) VALUES (?, ?, ?, ?, ?, ?)";
$stmt_sewa = $conn->prepare($sql_sewa);
if ($stmt_sewa) {
  $stmt_sewa->bind_param("ssssss", $idmeja, $iduser , $tanggal, $harga, $tot, $status2);
  $stmt_sewa->execute();

  // Ambil ID yang dihasilkan dari operasi penyisipan
  $id_sewa = $stmt_sewa->insert_id;

  $stmt_sewa->close();

  // Sisipkan data ke tabel jam_sewa menggunakan ID yang dihasilkan dari tabel sewa
  $sql_jam_sewa = "INSERT INTO jam_sewa (idsewa, idmeja, iduser, tanggal, jam, status) VALUES (?, ?, ?, ?, ?, ?)";
  $stmt_jam_sewa = $conn->prepare($sql_jam_sewa);
  if ($stmt_jam_sewa) {
    foreach ($jam as $j) {
      $stmt_jam_sewa->bind_param("ssssss", $id_sewa, $idmeja, $iduser , $tanggal, $j, $status1);
      $stmt_jam_sewa->execute();
    }

    $stmt_jam_sewa->close();
    $conn->close();

    echo json_encode(["message" => "Booking successful"]);
  } else {
    // Gagal menyiapkan statement untuk penyisipan ke tabel jam_sewa
    http_response_code(500);
    echo json_encode(["message" => "Failed to prepare statement for jam_sewa"]);
  }
} else {
  // Gagal menyiapkan statement untuk penyisipan ke tabel sewa
  http_response_code(500);
  echo json_encode(["message" => "Failed to prepare statement for sewa"]);
}
?>
