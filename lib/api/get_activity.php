<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

$servername = "localhost";
$username = "root"; // Ganti dengan username MySQL Anda
$password = ""; // Ganti dengan password MySQL Anda
$database = "db_billiard"; // Ganti dengan nama database Anda

// Buat koneksi ke database
$conn = new mysqli($servername, $username, $password, $database);

// Periksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Ambil id user dari parameter GET
$idUser = $_GET['iduser'];

// Buat query untuk mengambil data aktivitas
// $sql = "SELECT sewa.iduser, meja.idmeja, meja.nm, meja.foto, sewa.harga, sewa.tot, sewa.status
//         FROM sewa
//         JOIN jam_sewa ON sewa.idmeja = jam_sewa.idmeja
//         JOIN meja ON sewa.idmeja = meja.idmeja
//         WHERE sewa.iduser = $idUser
//         ORDER BY meja.idmeja DESC";
$sql = "SELECT sewa.iduser, meja.idmeja, sewa.tot, sewa.status, sewa.harga, meja.nm, meja.foto
        FROM sewa
        JOIN meja ON sewa.idmeja = meja.idmeja
        JOIN user ON sewa.iduser = user.id_user 
        LEFT JOIN bayar ON sewa.idsewa = bayar.idsewa
        WHERE sewa.iduser = '$idUser'";



// Jalankan query
$result = $conn->query($sql);

// Periksa apakah query menghasilkan hasil
if ($result->num_rows > 0) {
    // Jika ada hasil, simpan dalam array $activities
    $activities = array();
    while ($row = $result->fetch_assoc()) {
        $activities[] = $row;
    }
    // Encode array $activities menjadi JSON dan kirimkan sebagai respons
    echo json_encode($activities);
} else {
    // Jika tidak ada hasil, kirimkan pesan kesalahan
    echo json_encode(["error" => "No activities found"]);
}

// Tutup koneksi database
$conn->close();
