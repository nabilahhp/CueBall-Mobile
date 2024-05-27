import 'package:flutter/material.dart';
import 'package:mobile_bl/main.dart';
import 'package:mobile_bl/profile/profile_screen.dart';
import 'package:mobile_bl/widget_home/navigationbar.dart';
import '../constans.dart'; // Pastikan nama file ini benar, jika salah ganti dengan nama yang sesuai
import 'package:google_fonts/google_fonts.dart';
import '../hidden_textfield.dart'; // Pastikan file ini ada dan berfungsi dengan baik
import 'forgot.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dapatkan ukuran layar
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/data/latar.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                // Gunakan SingleChildScrollView agar bisa di-scroll pada layar kecil
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width *
                          0.08), // Menggunakan persentase untuk margin horizontal
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        // Gunakan Center untuk menempatkan teks di tengah
                        child: Text(
                          'Change Password',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: size.width *
                                0.08, // Menggunakan persentase untuk ukuran font
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: size.height *
                              0.02), // Menggunakan persentase untuk ukuran tinggi
                      Text(
                        "Current Password",
                        style: Interstyle.copyWith(
                          fontSize: size.width *
                              0.04, // Menggunakan persentase untuk ukuran font
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: PasswordTextFieldChPass(),
                      ),
                      SizedBox(height: size.height * 0.02),
                      TextButton(
                        onPressed: () {
                          // Navigasi ke halaman ForgotPass
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPass()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: Interrrstyle.copyWith(fontSize: size.width * 0.035),
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      Text(
                        "New Password",
                        style: Interstyle.copyWith(
                          fontSize: size.width * 0.04,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: PasswordTextFieldCPass1(),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        "Confirm New Password",
                        style: Interstyle.copyWith(
                          fontSize: size.width * 0.04,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: PasswordTextFieldCPass2(),
                      ),
                      SizedBox(height: size.height * 0.04),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: size.height *
                                  0.06, // Menggunakan persentase untuk tinggi tombol
                              margin: EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Save",
                                  style: Interrrstyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonColorBlack,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: size.height *
                                  0.06, // Menggunakan persentase untuk tinggi tombol
                              margin: EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Kembali ke halaman sebelumnya (ProfileScreen)
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: Interrrstyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonColorBlack,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
