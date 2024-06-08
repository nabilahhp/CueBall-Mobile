import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServicemeja {
  final String baseUrl = 'http://localhost:8000/projek_api/post_sewameja.php'; 

  Future<void> bookMeja(String idMeja, String idUser, List<String> jam, DateTime tanggal, String status1, String harga, String tot, String status2) async {
    final url = Uri.parse(baseUrl);
    
    // Format tanggal menjadi string dengan format yang diinginkan
    String formattedDate = "${tanggal.year}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')} 00:00:00";
    
    // Tampilkan nilai formattedDate untuk memeriksa apakah sudah sesuai
    print('Formatted Date: $formattedDate');
    
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'idmeja': idMeja,
        'idUser': idUser,
        'tanggal': formattedDate, // Kirim tanggal yang diformat ke server
        'jam': jam,
        'status1': status1,
        'harga': harga,
        'tot': tot,
        'status2': status2,
      }),
    );

    // Tangani respons dari server
    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print('Booking successful');
    } else {
      throw Exception('Failed to book meja');
    }
  }
}
