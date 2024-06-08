<?php
// Koneksi ke database MySQL
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

$host = 'localhost';
$dbUsername = 'root'; // Ganti dengan username MySQL Anda
$dbPassword = ''; // Ganti dengan password MySQL Anda
$dbName = 'db_billiard'; // Ganti dengan nama database Anda

$conn = new mysqli($host, $dbUsername, $dbPassword, $dbName);

// Periksa koneksi
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

// Endpoint API POST untuk pendaftaran pengguna
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Ambil data pengguna dari body permintaan
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';
    $namaLengkap = $_POST['nama_lengkap'] ?? '';
    $hp = $_POST['hp'] ?? '';
    $jenisKelamin = $_POST['jenis_kelamin'] ?? '';
    $alamat = $_POST['alamat'] ?? '';

    // Periksa apakah data yang dibutuhkan telah diberikan
    if (empty($email) || empty($password) || empty($namaLengkap) || empty($hp) || empty($jenisKelamin) || empty($alamat)) {
        // Kirim respons JSON jika data tidak lengkap
        $response = array("success" => false, "message" => "Email, password, nama lengkap, hp, jenis kelamin, alamat, dan foto diperlukan");
        echo json_encode($response);
        exit;
    }

    // Hash password menggunakan password_hash()
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Query untuk menyimpan data pengguna ke dalam tabel pengguna
    $sql = "INSERT INTO user (email, password, nama_lengkap, hp, jenis_kelamin, alamat) VALUES ('$email', '$hashedPassword', '$namaLengkap', '$hp', '$jenisKelamin', '$alamat')";

    if ($conn->query($sql) === TRUE) {
        // Jika penyimpanan berhasil, kirim respons JSON ke klien
        $response = array("success" => true, "message" => "User registered successfully");
        echo json_encode($response);
    } else {
        // Jika terjadi kesalahan, kirim respons JSON ke klien
        $response = array("success" => false, "message" => "Error: " . $sql . "<br>" . $conn->error);
        echo json_encode($response);
    }
}

// Tutup koneksi ke database
$conn->close();
?>
