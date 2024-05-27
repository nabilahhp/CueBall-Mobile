<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$servername = "localhost"; // Ganti dengan nama server database Anda
$username = "root"; // Ganti dengan username database Anda
$password = ""; // Ganti dengan password database Anda
$dbname = "db_billiard"; // Ganti dengan nama database Anda

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Ambil parameter dari URL
$idMeja = isset($_GET['idmeja']) ? $_GET['idmeja'] : null;
$tanggal = isset($_GET['tanggal']) ? $_GET['tanggal'] : null;

// Periksa apakah $idMeja tidak kosong
if ($idMeja !== null && $idMeja !== '') {
    // Periksa apakah tanggal tidak kosong dan sesuai dengan format yang diharapkan
    if ($tanggal !== null && $tanggal !== '') {
        // Format tanggal dari URL ke format yang sesuai dengan database
        $formattedTanggal = date('Y-m-d', strtotime($tanggal));

        // Query database untuk mendapatkan data jam sewa
        $sql = "SELECT * FROM jam_sewa WHERE idmeja = $idMeja AND DATE(tanggal) = '$formattedTanggal'";
    } else {
        // Jika tanggal kosong, hanya ambil data jam sewa berdasarkan id_meja
        $sql = "SELECT * FROM jam_sewa WHERE idmeja = $idMeja";
    }

    $result = $conn->query($sql);

    $jamSewa = [];

    if ($result->num_rows > 0) {
        // Mengambil hasil query dan menyimpannya dalam bentuk array
        while($row = $result->fetch_assoc()) {
            $jamSewa[] = $row;
        }
    }

    // Mengirimkan data sebagai JSON
    echo json_encode($jamSewa);
} else {
    // Jika $idMeja kosong, kirimkan pesan error
    echo json_encode(array("message" => "ID Meja tidak valid"));
}

// Menutup koneksi database
$conn->close();
?>
