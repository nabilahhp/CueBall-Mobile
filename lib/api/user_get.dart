// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<bool> authenticateUser(String email, String password) async {
//   if (email.isEmpty || password.isEmpty) {
//     // Jika email atau password kosong, kembalikan false dan tampilkan pesan kesalahan
//     return false;
//   }

//   final response = await http.post(
//     Uri.parse('http://localhost:8000/projek_api/get_user.php'), // Ganti dengan URL endpoint API Anda
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'email': email,
//       'password': password,
//     }),
//   );

//   if (response.statusCode == 200) {
//     var responseJson = json.decode(response.body);
//     return responseJson['success'];
//   } else {
//     return false;
//   }
// }

