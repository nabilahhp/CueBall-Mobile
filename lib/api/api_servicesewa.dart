import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServicesewameja {
  final String baseUrl = 'http://localhost:8000/projek_api/post_sewa.php'; 

  Future<void> bookSewa(String idMeja, String idUser, DateTime tanggal,  String harga, String tot, String status) async {
    final url = Uri.parse(baseUrl);
    
    // Format tanggal menjadi string dengan format yang diinginkan
    String formattedDate = "${tanggal.year}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')} 00:00:00";
    
    // Tampilkan nilai formattedDate untuk memeriksa apakah sudah sesuai
    print('Formatted Date: $formattedDate');
    
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'idUser': idUser,
        'idmeja': idMeja,
        'tanggal': formattedDate, 
        'harga': harga,
        'tot': tot,
        'status': status,
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
