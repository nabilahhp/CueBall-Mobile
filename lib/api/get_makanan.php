<?php
header("Access-Control-Allow-Origin: *"); // Mengizinkan permintaan dari domain apa pun
header("Content-Type: application/json");

header('Content-Type: application/json');

// Informasi koneksi database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_billiard";

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

// Query untuk mengambil semua data dari tabel makanan
$sql = "SELECT * FROM makanan";
$result = $conn->query($sql);

$makanan = array();
if ($result->num_rows > 0) {
    // Mengambil semua data dan memasukkannya ke dalam array
    while($row = $result->fetch_assoc()) {
        $makanan[] = $row;
    }
} else {
    $makanan = ["message" => "No records found"];
}

// Mengembalikan data dalam format JSON
echo json_encode($makanan);

// Menutup koneksi
$conn->close();
?>
