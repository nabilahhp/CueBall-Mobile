<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");
// Mengatur koneksi ke database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_billiard"; // Ganti dengan nama database Anda

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query untuk mengambil data dari database
$sql = "SELECT nama_lengkap FROM user WHERE nama_lengkap = 'erick'";
$result = $conn->query($sql);

// Menyiapkan array untuk menyimpan data
$makanan = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $makanan[] = $row;
    }
}

// Menutup koneksi database
$conn->close();

// Mengirimkan respons dalam format JSON
echo json_encode($makanan);
?>
