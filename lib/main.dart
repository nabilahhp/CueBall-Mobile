import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bl/password/forgot.dart';
import 'package:mobile_bl/widget_home/navigationbar.dart';
import 'package:mobile_bl/api/user_provider.dart';
import 'package:mobile_bl/api/user.dart';
import 'constans.dart';
import 'RegisterPage.dart';
import 'hidden_textfield.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'provider/cart_provider.dart';
import 'dart:convert';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: LoginPage(), // Set LoginPage sebagai halaman awal
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
  final String email = emailController.text;
  final String password = passwordController.text;

  // Validasi input
  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Email and password are required')),
    );
    print('Email and password are required');
    return;
  }

  try {
    final response = await http.post(
      Uri.parse('http://localhost:8000/projek_api/get_user.php'),
      body: {'email': email, 'password': password},
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['success'] != null &&
          responseData['success'] == 'Login successful') {
        // Mendapatkan nilai nama lengkap dari respons server
        String namaLengkap = responseData['nama_lengkap'] ?? '';
        String idUser = responseData['id_user'].toString() ?? '';
        String hp = responseData['hp'] ?? '';
        String jenisKelamin = responseData['jenis_kelamin'] ?? '';
        String alamat = responseData['alamat'] ?? '';
        String foto = responseData['foto'] ?? '';
        // Membuat objek User baru dengan nilai nama lengkap
        User user = User(
          idUser: idUser,
          email: email,
          password: password,
          hp: hp,
          jenisKelamin: jenisKelamin,
          namaLengkap: namaLengkap,
          alamat: alamat,
          foto: foto,
        );
        // Memperbarui UserProvider dengan objek User baru
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        // Navigasi ke halaman berikutnya
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavigationMenu(selectedIndex: 0,idUser: idUser)),
        );
        // Lakukan tindakan lain jika diperlukan
      } else if (responseData['error'] != null) {
        // Tangani kesalahan jika login gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['error'])),
        );
        print(responseData['error']);
      } else {
        // Tangani kesalahan jika respons tidak sesuai dengan yang diharapkan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to login. Please try again later.')),
        );
        print('Failed to login. Please try again later.');
      }
    }
  } catch (error) {
    // Tangani kesalahan jika terjadi error selama proses login
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $error')),
    );
    print('Error: $error');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/data/latar.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                    color: Color(0xffffffff),
                  ),
                ),
                SizedBox(height: 11),
                Text(
                  "Welcome back! Please log in to continue your journey with us.",
                  style: Interstyle.copyWith(fontSize: 15),
                ),
                SizedBox(height: 34),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: Interstyle.copyWith(fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "ERICKO@gmail.com",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "password",
                      style: Interstyle.copyWith(fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: PasswordTextFieldLogin(
                          controller: passwordController,
                        )),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Remember Me",
                          style: Interstyle.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPass()),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: Interstyle.copyWith(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      login(
                          context); // Panggil fungsi login saat tombol ditekan
                    },
                    child: Text(
                      "Log In",
                      style: Interstyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                  ),
                ),
                SizedBox(height: 45),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.0),
                      child: Text(
                        "Or with",
                        style: TextStyle(
                          color: Color(0xfffffffff),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: Interstyle.copyWith(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: Interstyle.copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
