import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constans.dart';
import 'RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

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
            margin: EdgeInsets.symmetric(
              horizontal: 32,
            ),
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
                SizedBox(
                  height: 11,
                ),
                Text(
                  "Welcome back! Please log in to continue your journey with us.",
                  style: Interstyle.copyWith(fontSize: 15),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 34,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: Interstyle.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "ERICKO@gmail.com",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 16)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "password",
                      style: Interstyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.visibility_off),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 16)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
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
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Remember Me",
                          style: Interstyle.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                    Text(
                      "Forgot Password?",
                      style: Interstyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    width: double.infinity,
                    // margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Log In",
                        style: Interstyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor),
                    )),
                SizedBox(
                  height: 45,
                ),
                Text(
                  " ────────────── Or with ──────────────",
                  style: Interrstyle.copyWith(fontSize: 13),
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: Interstyle.copyWith(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman pendaftaran
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: Interrrstyle.copyWith(fontSize: 15),
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
