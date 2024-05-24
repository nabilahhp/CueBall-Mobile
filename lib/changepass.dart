import 'package:flutter/material.dart';
import 'constans.dart'; // Pastikan nama file ini benar, jika salah ganti dengan nama yang sesuai
import 'package:google_fonts/google_fonts.dart';
import 'hidden_textfield.dart'; // Pastikan file ini ada dan berfungsi dengan baik

class ChangePass extends StatelessWidget {
  const ChangePass({Key? key}) : super(key: key);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Change Password',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Current Password",
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
                  child: PasswordTextFieldChPass(),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Forgot Password?",
                  style: Interrrstyle.copyWith(fontSize: 13),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "New Password",
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
                      child: PasswordTextFieldCPass1(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Confirm New Password",
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
                      child: PasswordTextFieldCPass2(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: Interrrstyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColorBlack,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
