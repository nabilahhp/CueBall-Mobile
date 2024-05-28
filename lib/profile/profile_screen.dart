import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_bl/main.dart';
import 'package:mobile_bl/screens/activity_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile_bl/profile/editprofile.dart';
import 'package:mobile_bl/password/changepass.dart';
import 'package:mobile_bl/widget_home/navigationbar.dart';
import 'package:mobile_bl/RegisterPage.dart';
import 'package:mobile_bl/password/changepass.dart';
import './components/profile_menu.dart';
import './components/profile_pic.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ProfileScreen extends StatelessWidget {
  // Fungsi untuk membuka WhatsApp
  void launchWhatsapp({required String number, required String message}) async {
    // Gunakan URL yang valid untuk membuka WhatsApp
    String url = "https://wa.me/$number?text=${Uri.encodeComponent(message)}";

    // Cek apakah aplikasi bisa membuka URL
    if (await canLaunch(url)) {
      await launch(url); // Buka URL jika memungkinkan
    } else {
      print(
          "Can't open WhatsApp"); // Tampilkan pesan jika tidak dapat membuka URL
    }
  }

  const ProfileScreen({Key? key}) : super(key: key);

  Future<void> _uploadImage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Hanya memilih file gambar
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      final directory = await getApplicationDocumentsDirectory();
      final String newPath = "${directory.path}/profile_image.png";
      await file.copy(newPath);
      // Jika Anda ingin menampilkan gambar di UI, Anda bisa mengubah state menggunakan setState
    } else {
      // Pengguna membatalkan pemilihan file
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                SizedBox(
                    height:
                        80), // Menambahkan jarak agar tidak tertutupi oleh tombol kembali
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
                ProfilePic(
                  onUploadPressed: () {
                    _uploadImage(context);
                  },
                ),
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
                  press: () {
<<<<<<< Updated upstream
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ActivityPage(idUser: idUser,)),
                    // );
=======
>>>>>>> Stashed changes
                  },
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
          // Positioned(
          //   left: 30,
          //   top: 40,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       shape: BoxShape.circle,
          //     ),
          //     child: Center(
          //       child: IconButton(
          //         padding: EdgeInsets.all(0),
          //         onPressed: () {
          //           Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => NavigationMenu(idUser: idUser)),
          //           );
          //         },
          //         icon: Icon(
          //           Icons.arrow_back_ios,
          //           color: Colors.yellow,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
