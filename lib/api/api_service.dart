import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_bl/api/meja.dart'; // Import model Meja
import 'package:mobile_bl/api/jam_sewa.dart'; // Import model JamSewa

class ApiService {
  final String baseUrl = 'http://localhost:8000/projek_api/get_sewa.php'; // Ganti dengan URL API Anda

  Future<List<JamSewa>> fetchJamSewa(String idMeja, String tanggal) async {
    final response = await http.get(Uri.parse('$baseUrl?idmeja=$idMeja&tanggal=$tanggal'));
    
    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      if (data is List) {
        return data.map((e) => JamSewa.fromJson(e)).toList();
      } else {
        throw Exception('Failed to parse response data');
      }
    } else {
      throw Exception('Failed to load jam sewa');
    }
  }

  // Contoh metode lain untuk mengambil data meja
  Future<List<Meja>> fetchMeja() async {
    final response = await http.get(Uri.parse('$baseUrl/meja'));
    
    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      if (data is List) {
        return data.map((e) => Meja.fromJson(e)).toList();
      } else {
        throw Exception('Failed to parse response data');
      }
    } else {
      throw Exception('Failed to load meja');
    }
  }
}
