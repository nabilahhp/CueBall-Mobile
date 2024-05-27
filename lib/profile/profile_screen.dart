import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< Updated upstream
import 'package:mobile_bl/home.dart';
import 'package:mobile_bl/main.dart';
import 'package:mobile_bl/password/changepass.dart';
import 'package:mobile_bl/profile/editprofile.dart';
import 'package:mobile_bl/widget_home/navigationbar.dart';
import 'package:url_launcher/url_launcher.dart'; // Import paket url_launcher
=======
import 'package:mobile_bl/RegisterPage.dart';
import 'package:mobile_bl/password/changepass.dart';
>>>>>>> Stashed changes

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  // Fungsi untuk membuka WhatsApp
  void launchWhatsapp({required String number, required String message}) async {
    // Gunakan URL yang valid untuk membuka WhatsApp
    String url = "https://wa.me/$number?text=${Uri.parse(message)}";

    // Cek apakah aplikasi bisa membuka URL
    if (await canLaunch(url)) {
      await launch(url); // Buka URL jika memungkinkan
    } else {
      print("Can't open WhatsApp"); // Tampilkan pesan jika tidak dapat membuka URL
    }
  }

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Positioned(
              left: 30,
              top: 40,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavigationMenu()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Profile",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "Edit Profile",
              icon: "assets/icons/User Icon.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Change Password",
              icon: "assets/icons/Settings.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePass()),
                );
              },
            ),
            ProfileMenu(
              text: "Contact Us",
              icon: "assets/icons/Conversation.svg",
              press: () {
                // Panggil fungsi untuk membuka WhatsApp
                launchWhatsapp(number: "+6285704478791", message: "");
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
