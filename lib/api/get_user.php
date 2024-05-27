<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

// Memeriksa apakah email dan kata sandi disertakan dalam permintaan
if (!isset($_POST['email']) || !isset($_POST['password'])) {
    echo json_encode(["error" => "Email and password are required"]);
    exit();
}

$email = $_POST['email'];
$password = $_POST['password'];

// Informasi koneksi database
$servername = "localhost";
$username = "root";
$dbPassword = "";
$dbname = "db_billiard";

// Membuat koneksi
$conn = new mysqli($servername, $username, $dbPassword, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// Mencari pengguna berdasarkan email
$sql = "SELECT * FROM user WHERE email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // Pengguna ditemukan, verifikasi kata sandi
    $user = $result->fetch_assoc();
    if (password_verify($password, $user['password'])) {
        echo json_encode(["success" => "Login successful"]);
    } else {
        echo json_encode(["error" => "Invalid email or password"]);
    }
} else {
    echo json_encode(["error" => "User not found"]);
}

$stmt->close();
$conn->close();
?>
